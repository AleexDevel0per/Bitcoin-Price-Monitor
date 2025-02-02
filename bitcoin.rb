require 'net/http'
require 'json'

class Bitcoin
  def initialize
    @url = 'https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=usd,eur,brl'
  end

  def monitor_price(interval = 30)
    loop do
      prices = fetch_bitcoin_prices
      if prices
        puts "==============================="
        puts "Monitoramento do Preço do Bitcoin:"
        puts "USD: $#{format_number(prices[:usd])}"
        puts "EUR: €#{format_number(prices[:eur])}"
        puts "BRL: R$#{format_number(prices[:brl])}"
        puts "==============================="
        countdown(interval)
      else
        puts "❌ Erro ao obter preços do Bitcoin! Aguardando antes de tentar novamente..."
        countdown(60)
      end
    end
  rescue Interrupt
    puts "\n🛑 Monitoramento interrompido pelo usuário."
  end

  private

  def fetch_bitcoin_prices
    url = URI(@url)
    response = Net::HTTP.get_response(url)

    case response.code.to_i
    when 200
      data = JSON.parse(response.body)
      if data['bitcoin']
        return {
          usd: data['bitcoin']['usd'],
          eur: data['bitcoin']['eur'],
          brl: data['bitcoin']['brl']
        }
      else
        puts "❗ Resposta inesperada da API."
        return nil
      end
    when 429
      puts "❗ Falha na requisição: 429 - Too Many Requests"
      return nil
    else
      puts "❗ Falha na requisição: #{response.code} - #{response.message}"
      return nil
    end
  rescue StandardError => e
    puts "❗ Erro inesperado: #{e.message}"
    nil
  end

  def format_number(number)
    parts = ('%.2f' % number).split('.')
    parts[0] = parts[0].reverse.gsub(/(\d{3})(?=\d)/, '\\1.').reverse
    parts.join(',')
  end

  def countdown(seconds)
    print "🔄 Próxima atualização em: #{seconds} segundos"
    seconds.downto(1) do |i|
      print "\r🔄 Próxima atualização em: #{i} segundos"
      sleep(1)
    end
    puts "\r⏳ Atualizando preços agora...          "
  end
end


bitcoin_monitor = Bitcoin.new
bitcoin_monitor.monitor_price(30)