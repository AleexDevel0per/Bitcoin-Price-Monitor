# Bitcoin Price Monitor 📊
### 📌 Descrição

Este script em Ruby monitora o preço do Bitcoin (BTC) em tempo real, exibindo os valores em Dólar (USD), Euro (EUR) e Real (BRL).

Ele utiliza a API da CoinGecko para obter os preços e atualiza os valores periodicamente. O intervalo de atualização pode ser definido pelo usuário.

---
### ⚙ Pré-requisitos

Antes de executar o script, você precisa ter:

- ✅ Ruby instalado (versão 2.7 ou superior recomendada)
- ✅ Conexão com a internet para acessar a API da CoinGecko

### 🚀 Como Executar o Script

- Baixe ou copie o código para um arquivo chamado bitcoin.rb
- Abra o terminal e vá até o diretório onde o arquivo está salvo
- Execute o script com:
``` ruby
    ruby bitcoin.rb
```

Por padrão, ele atualiza os preços a cada 30 segundos. Para alterar esse intervalo, modifique a linha:
```ruby
bitcoin_monitor.monitor_price(30) # Altere o número de segundos
```
Exemplo para atualização a cada 10 segundos:
``` ruby
bitcoin_monitor.monitor_price(10)
```

---
### 🔧 Como Funciona o Código?
#### 1️⃣ Classe Bitcoin

A classe principal que faz o monitoramento dos preços.

---
#### 2️⃣ Método monitor_price(interval)

📌 **Descrição:**

Inicia um loop que obtém os preços do Bitcoin a cada intervalo definido.
Em caso de erro, espera 60 segundos antes de tentar novamente.
Mostra os preços e inicia a contagem regressiva para a próxima atualização.

---
#### 3️⃣ Método fetch_bitcoin_prices

📌 **Descrição:**

Faz uma requisição para a API da CoinGecko e retorna os preços.
    
Se a API responder com erro 429 - Too Many Requests, o código aguarda antes de tentar de novo.

---
#### 4️⃣ Método format_number(number)

📌 **Descrição:**

Formata os preços adicionando separadores de milhar (exemplo: 45.500,75).

---
#### 5️⃣ Método countdown(seconds)

📌 **Descrição:**

Mostra uma contagem regressiva dinâmica no terminal antes da próxima atualização.

🖥 Exemplo de Saída no Terminal

```
===============================
Monitoramento do Preço do Bitcoin:
USD: $45.500,75
EUR: €38.100,30
BRL: R$230.000,99
===============================
🔄 Próxima atualização em: 30 segundos
⏳ Atualizando preços agora...
```

Se houver erro na API:
```
❗ Falha na requisição: 429 - Too Many Requests
❌ Erro ao obter preços do Bitcoin! Aguardando antes de tentar novamente...
🔄 Próxima atualização em: 60 segundos
```

---
### 🛠 Possíveis Melhorias Futuras

- ✅ Suporte para mais moedas além de USD, EUR e BRL
- ✅ Salvar os preços em um arquivo CSV para análise histórica
- ✅ Criar um dashboard com interface gráfica

---
### 🏆 Conclusão

Este script é uma forma simples de monitorar os preços do Bitcoin em tempo real usando Ruby. Ele é leve, rápido e pode ser executado diretamente no terminal.

Caso queira expandi-lo, sinta-se à vontade para modificar e melhorar o código!