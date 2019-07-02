# PMD-Benchmark

## Como configurar o ambiente

Basta executar o script `setup.sh`.

## Como replicar os resultados

### cbworkloadgen

Primeiro é necessário criar um *bucket* chamado `default`.
Para replicar os testes descritos, basta executar os comandos:

```
sudo docker exec -it db bash
/opt/couchbase/bin/cbworkloadgen -n localhost:8091 -u [usuario] -p [senha] -r [razao] -vvv -t 10 -i 500000
```

Onde `[usuario]` e `[senha]` devem ser substituídos por usuário e senha administrativa do Couchbase e `[razao]` pela razão escrita/leitura desejada. Observe que é o contrário de leitura/escrita. 

### YCSB
Primeiro é necessário criar um *bucket* chamado `ycsb-workload-a`.
Basta clonar este repositório (`git clone https://github.com/gabrielrodriguesrocha/PMD-Benchmark`) e executar:

```
cd PMD-Benchmark
tar -xvf ycsb-couchbase2-binding-0.15.0-SNAPSHOT.tar.gz
cd ycsb-couchbase2-binding-0.15.0-SNAPSHOT
sh setup_d.sh
 ./multithreaded_runner.sh -d couchbase2 -w workload[x]_couchbase_custom -i 6
```

Onde `[x]` é um valor no conjunto `{a,b,c,q1,q2}`. Para executar o *workload* D, é necessário executar o script `test_d.sh`, pois esse *workload* envolve inserção de elementos e precisa ter o *bucket* recriado a cada teste feito.

## Como gerar os gráficos e tabelas

Basta executar o Jupyter Notebook contido no diretório `graphs`, chamado `YCSB.ipynb`.
