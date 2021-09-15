#Docker Evaluator Action Prototype v0

Atualmente esse protótipo pressupõe o seguinte conjunto de pastas:

```bash
.
├── action.yml
├── challenges
│   ├── command01.dc
│   ├── command02.dc
│   └── command03.dc
├── challenges-params
│   ├── command01.dcp
│   ├── command02.dcp
│   └── command03.dcp
├── docker-compose.yml
├── Dockerfile
├── expected-results
│   ├── command01.dcr
│   ├── command02.dcr
│   └── command03.dcr
├── README.md
└── scripts
    ├── entrypoint.sh
    └── test_runner.sh
```

- `challenges` é referente aos desafios que a pessoa estudante deve executar, cada `commandXX.dc` é um desafio;
- `challenges-params` é uma forma de conseguirmos tratar o retorno desses desafios, de maneira que gerar um output que possa ser comparado com a rubrica ;
- `expected-results` é a rubrica (o resultado esperado) daquele projeto

**⚠️ O protótipo como ação, ainda não foi testada**

### Requisitos para testes locais

- `Docker version >= 20.10.8`
- `docker-compose version >= 1.29.2`

### Rodando a ação localmente

The command:

```bash
docker-compose up
```

Should return:

```bash
Starting trybe-docker-evaluator ... done
Attaching to trybe-docker-evaluator
trybe-docker-evaluator | 
trybe-docker-evaluator | ======================== command01 ========================
trybe-docker-evaluator | 
trybe-docker-evaluator | Executando comando: docker container create --name container_req_1 ubuntu
trybe-docker-evaluator | 
trybe-docker-evaluator | Resultado esperado: true
trybe-docker-evaluator | 
trybe-docker-evaluator | Resultado obtido: true
trybe-docker-evaluator | 
trybe-docker-evaluator | PASS
trybe-docker-evaluator | 
trybe-docker-evaluator | ====================== command01-end ======================
trybe-docker-evaluator | 
trybe-docker-evaluator | ======================== command02 ========================
trybe-docker-evaluator | 
trybe-docker-evaluator | Executando comando: docker ps -a
trybe-docker-evaluator | 
trybe-docker-evaluator | Resultado esperado: "\"bash\"""ubuntu""container_req_1""Created"
trybe-docker-evaluator | 
trybe-docker-evaluator | Resultado obtido: "\"bash\"""ubuntu""container_req_1""Created"
trybe-docker-evaluator | 
trybe-docker-evaluator | PASS
trybe-docker-evaluator | 
trybe-docker-evaluator | ====================== command02-end ======================
trybe-docker-evaluator | 
trybe-docker-evaluator | ======================== command03 ========================
trybe-docker-evaluator | 
trybe-docker-evaluator | Executando comando: docker container rm container_req_1
trybe-docker-evaluator | 
trybe-docker-evaluator | Resultado esperado: container_req_1
trybe-docker-evaluator | 
trybe-docker-evaluator | Resultado obtido: container_req_1
trybe-docker-evaluator | 
trybe-docker-evaluator | PASS
trybe-docker-evaluator | 
trybe-docker-evaluator | ====================== command03-end ======================
trybe-docker-evaluator | base64: unrecognized option: w
trybe-docker-evaluator | BusyBox v1.31.1 () multi-call binary.
trybe-docker-evaluator | 
trybe-docker-evaluator | Usage: base64 [-d] [FILE]
trybe-docker-evaluator | 
trybe-docker-evaluator | Base64 encode or decode FILE to standard output
trybe-docker-evaluator |        -d      Decode data
trybe-docker-evaluator | ::set-output name=result::
trybe-docker-evaluator exited with code 0
```
