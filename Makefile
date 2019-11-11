ALL=help install dump-dependencies
.PHONY: ${ALL}
.SILENT: help

# help - Exibe as informacoes na tela
help:
	echo ""
	echo "Utilize make [comando] para executar ações no projeto"
	echo ""
	grep -E --color=never "^# [a-z0-9-]+ - " Makefile | sed 's/^# /\tmake /'
	echo ""

# install - Instala as dependencias do projeto
install:
	pip install -r requirements.txt

# dump-dependencies - Exporta as dependencias para o arquivo requirements.txt
dump-dependencies:
	pip freeze > requirements.txt

# run - Inicializa o servidor em foreground
run:
	flask run

# pack - Cria arquivo .tar para uso em instalação
pack:
	git archive -v --format=tar --output='flask-app-v$(shell git tag -l --sort="-v:refname" | head -n 1).tar' HEAD
