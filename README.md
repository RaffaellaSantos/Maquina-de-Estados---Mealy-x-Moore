# Máquina de Estados — Mealy x Moore

Este repositório contém projetos completos de circuitos sequenciais síncronos implementados no **Quartus 20.1**, que têm como objetivo **reconhecer o primeiro zero após a ocorrência de três ou mais uns consecutivos**.

## 🔍 O que é uma Máquina de Estados?

Uma **máquina de estados finitos (FSM)** é um modelo de comportamento usado para representar sistemas digitais sequenciais. Ela muda de estado com base nas entradas e em seu estado atual, e é amplamente usada em controle de sistemas, protocolos digitais e lógica sequencial.

Existem dois tipos principais de máquinas de estados:

- **Máquina de Mealy**: a saída depende do **estado atual** e da **entrada atual**. Isso pode resultar em respostas mais rápidas, pois as saídas mudam imediatamente com as entradas.
  
- **Máquina de Moore**: a saída depende **somente do estado atual**. Apesar de mais lenta em alguns casos, é mais simples de testar e prever o comportamento.

## 🗂️ Estrutura das Pastas

```
├── Diagramas de sequência
│   ├── mealy_machine_FFD_bd        → Diagrama com Flip-Flops tipo D
│   ├── mealy_machine_FFJK_bd       → Diagrama com Flip-Flops tipo JK
│   ├── moore_machine_bd            → Diagrama de bloco da máquina de Moore
├── Maquinas em verilog
│   ├── mealy_FFJK_v                → Código Verilog da Mealy com Flip-Flop JK
│   ├── moore_FFD_v                 → Código Verilog da Moore com Flip-Flop D
│   ├── moore_FFJK_v                → Código Verilog da Moore com Flip-Flop JK
├── README.md                       → Este arquivo
```

## 📁 Explicação dos Arquivos

### 1. **Diagramas de Sequência**
- **mealy_machine_FFD_bd**, **mealy_machine_FFJK_bd** e **moore_machine_bd**: contêm diagramas lógicos dos circuitos, com flip-flops, portas lógicas e conexões. Úteis para visualizar o funcionamento e transição de estados.

### 2. **Arquivos Verilog**
- **mealy_FFJK.v**: implementação da máquina de Mealy com flip-flops JK. O comportamento da saída depende da entrada e estado.
- **MooreMachine.v**: implementação da máquina de Moore com flip-flops tipo D.
- **mooreJK.v**: versão da máquina de Moore com flip-flops JK, com lógica de excitação implementada conforme a tabela de transições.

### 3. **Imagens**
- `state_mealy.jpg` e `state_moore_BLOCK.jpg`: diagramas ilustrando as transições de estado de ambas as máquinas, servindo como referência visual durante a análise dos circuitos.

## 🧪 Como testar no Quartus (versão 20.1)

1. **Abrir o projeto**
   - Localize o arquivo com extensão `.qsf` dentro da pasta do projeto desejado (ex: `mealy_FFJK.qsf`).
   - Dê duplo clique para abrir no **Quartus Prime 20.1**.

2. **Simular o circuito**
   - Vá até a aba `Simulation` > `RTL Simulation`.
   - Use o arquivo de waveform `.vwf` para executar a simulação:
     - Exemplo: `mealy_testbench.vwf`
     - Ele já contém a configuração de entrada (`x`, `clk`, `reset`) e a saída esperada (`z`).
   - Clique em **Run Simulation**.

3. **Verificar resultados**
   - Confirme se a saída `z` está sendo acionada corretamente após detectar o primeiro `0` após três `1`s consecutivos.

## ✅ Resultado esperado

A saída `z` deve ser igual a `1` **somente uma vez**, **imediatamente após** a primeira ocorrência de `0` **seguida de três ou mais `1`s consecutivos**.
