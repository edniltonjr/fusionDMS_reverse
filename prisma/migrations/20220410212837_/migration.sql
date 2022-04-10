-- CreateTable
CREATE TABLE "atvpw_bkp_t02_usuario" (
    "t02_id" BIGINT,
    "t02_descricao" VARCHAR,
    "t02_tipo" VARCHAR,
    "t02_login" VARCHAR,
    "t02_senha" VARCHAR,
    "t02_empresa_id" BIGINT,
    "t02_perfil_id" BIGINT,
    "t02_codigo_erp" VARCHAR,
    "t02_email" TEXT,
    "t02_telefone" VARCHAR,
    "t02_sn_exibe_help_campos" CHAR(1),
    "t02_googleapi" VARCHAR,
    "t02_primeiro_acesso" CHAR(1),
    "t02_ordem_colunas_form_cargas" TEXT,
    "t02_data_hora_atualizacao" TIMESTAMP(6),
    "t02_filial_expedicao_padrao" BIGINT,
    "t02_filiais_fatura_padrao" VARCHAR,
    "t02_situacao" BIGINT,
    "t02_faixa_valor" VARCHAR,
    "t02_habilita_botao_ped_formar_carga" CHAR(1)
);

-- CreateTable
CREATE TABLE "bairros" (
    "id" BIGSERIAL NOT NULL,
    "cidade_id" BIGINT NOT NULL,
    "nome" VARCHAR(255) NOT NULL,
    "ibge_id" BIGINT,

    CONSTRAINT "bairros_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "cidades" (
    "id" BIGSERIAL NOT NULL,
    "nome" VARCHAR(255) NOT NULL,
    "estado" VARCHAR(2) NOT NULL,
    "ibge_id" BIGINT,

    CONSTRAINT "cidade_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "clientes" (
    "cnpjcliente" VARCHAR(45) NOT NULL,
    "fantasia" VARCHAR(255),
    "razsocial" VARCHAR(255) NOT NULL,
    "endereco" VARCHAR(255) NOT NULL,
    "uf" VARCHAR(45) NOT NULL,
    "cidade" VARCHAR(45) NOT NULL,
    "cep" VARCHAR NOT NULL DEFAULT E'',
    "longitude" DOUBLE PRECISION,
    "latitude" DOUBLE PRECISION,
    "local_confirmado" CHAR(1) NOT NULL DEFAULT E'N',
    "bairro" VARCHAR(45),
    "email1" VARCHAR(100),
    "email2" VARCHAR(100),
    "email3" VARCHAR(100),
    "telefone_fixo1" VARCHAR(45),
    "telefone_fixo2" VARCHAR(45),
    "celular" VARCHAR(45),
    "senha_portal" VARCHAR(45),
    "sn_verificado_sefaz" CHAR(1) NOT NULL DEFAULT E'N',
    "inscricao_estadual" VARCHAR(45),
    "data_inicio_atividades" DATE,
    "regime_apuracao" VARCHAR(45),
    "cnae" VARCHAR(45),
    "numero_endereco" VARCHAR(45),
    "consta_cadastro_sefaz" CHAR(1),
    "municipio_id" BIGINT,
    "fax" VARCHAR(45),
    "tipo_pessoa" VARCHAR(45),
    "sexo" VARCHAR(45),
    "estado_civil" VARCHAR(45),
    "utiliza_insc_estadual" VARCHAR(45),
    "inscricao_municipal" VARCHAR(45),
    "referencia_para_entrega" VARCHAR(45),
    "data_hora_atualizacao" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "qualidade_geocod" SMALLINT NOT NULL DEFAULT 0,
    "recuperar_senha_token" VARCHAR(200),
    "cli_data_sincronizacao" TIMESTAMP(6) NOT NULL DEFAULT '2020-07-24 21:15:43.179464'::timestamp without time zone,
    "origem_geocodificacao" VARCHAR(255) NOT NULL DEFAULT E'Base de Conhecimento (U)',
    "habilitado" CHAR(1) DEFAULT E'N',

    CONSTRAINT "clientes_pkey" PRIMARY KEY ("cnpjcliente")
);

-- CreateTable
CREATE TABLE "config_desvios" (
    "nome" VARCHAR NOT NULL,
    "lambda" VARCHAR NOT NULL,
    "executor" VARCHAR NOT NULL DEFAULT E'MySQL',
    "sigla" VARCHAR NOT NULL,
    "ativo" SMALLINT NOT NULL DEFAULT 1,
    "parametros" TEXT,

    CONSTRAINT "config_desvios_pkey" PRIMARY KEY ("sigla")
);

-- CreateTable
CREATE TABLE "fila_kmRealizado" (
    "alias_db" VARCHAR(255) NOT NULL,
    "empresa_id" INTEGER NOT NULL,
    "romaneio_id" INTEGER NOT NULL,
    "data_saida" TIMESTAMP(6) NOT NULL,
    "data_retorno" TIMESTAMP(6) NOT NULL,
    "status" VARCHAR(120) NOT NULL DEFAULT E'Fila',
    "info" TEXT,
    "data_registro" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "data_processado" TIMESTAMP(6),
    "transporte_id" INTEGER,
    "motorista_id" INTEGER,

    CONSTRAINT "fila_kmRealizado_pkey" PRIMARY KEY ("alias_db","empresa_id","romaneio_id")
);

-- CreateTable
CREATE TABLE "log01_exclusao_ids_tabela" (
    "log01_apelido_bd" VARCHAR NOT NULL,
    "log01_id" BIGINT NOT NULL,
    "log01_id_empresa" BIGINT NOT NULL,
    "log01_tabela" VARCHAR NOT NULL,
    "log01_id_removido" BIGINT NOT NULL,
    "log01_data_hora" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "log01_exclusao_ids_tabela_pkey" PRIMARY KEY ("log01_apelido_bd","log01_id")
);

-- CreateTable
CREATE TABLE "log_erro_importacao" (
    "id" BIGSERIAL NOT NULL,
    "nome_tabela" VARCHAR NOT NULL,
    "data_hora" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "empresas_ids" VARCHAR,
    "erro" TEXT NOT NULL,
    "apelido_bd" VARCHAR NOT NULL,

    CONSTRAINT "log_erro_importacao_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "log_sequenciamento_cliente" (
    "id" BIGSERIAL NOT NULL,
    "empresa" BIGINT NOT NULL,
    "tipo_agrupamento" VARCHAR NOT NULL,
    "cliente_id" BIGINT NOT NULL,
    "cliente_id_anterior" BIGINT,
    "ordem" INTEGER NOT NULL,
    "data_hora" TIMESTAMP(6) NOT NULL,
    "agrupamento_id" BIGINT,

    CONSTRAINT "log_sequenciamento_cliente_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "notificacao" (
    "id" SERIAL NOT NULL,
    "title" VARCHAR(255) NOT NULL,
    "description" TEXT,
    "date_end" TIMESTAMP(6) NOT NULL,
    "company_affected" VARCHAR,
    "type" VARCHAR DEFAULT E'info',
    "times_to_show" INTEGER NOT NULL DEFAULT 1,
    "active" BOOLEAN DEFAULT true,

    CONSTRAINT "notificacao_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "pc01_parameters" (
    "pc01_name" VARCHAR NOT NULL,
    "pc01_type" VARCHAR DEFAULT E'TextBox',
    "pc01_label" VARCHAR NOT NULL,
    "pc01_module" VARCHAR NOT NULL,
    "pc01_category" VARCHAR NOT NULL,
    "pc01_description" VARCHAR NOT NULL,
    "pc01_default" VARCHAR NOT NULL,
    "pc01_config" JSON,
    "pc01_type_vision" VARCHAR(255),

    CONSTRAINT "pc01_parameters_pkey" PRIMARY KEY ("pc01_name")
);

-- CreateTable
CREATE TABLE "pc02_parameters_clients" (
    "pc02_parameter_name" VARCHAR NOT NULL,
    "pc02_client_cnpj" VARCHAR NOT NULL,
    "pc02_value" VARCHAR NOT NULL,
    "pc02_data_created" TIMESTAMP(6) DEFAULT '2020-07-06 12:34:58.282687'::timestamp without time zone,
    "pc02_data_updated" TIMESTAMP(6),
    "pc02_extra" VARCHAR,

    CONSTRAINT "pc02_parameters_clients_pkey" PRIMARY KEY ("pc02_parameter_name","pc02_client_cnpj")
);

-- CreateTable
CREATE TABLE "pc03_email_notification_send" (
    "pc03_id" SERIAL NOT NULL,
    "pc03_email" VARCHAR NOT NULL,
    "pc03_empresa_id" BIGINT,
    "pc03_cnpj" VARCHAR,
    "pc03_data_created" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "pc03_entrega_id" BIGINT,
    "pc03_cliente_id" BIGINT,
    "pc03_status" VARCHAR,

    CONSTRAINT "pc03_email_send_pkey" PRIMARY KEY ("pc03_id")
);

-- CreateTable
CREATE TABLE "release_notes" (
    "rn_id" BIGSERIAL NOT NULL,
    "rn_titulo" VARCHAR(255) NOT NULL,
    "rn_descricao" TEXT,
    "rn_versao" VARCHAR(50) NOT NULL,
    "rn_plataforma" VARCHAR DEFAULT E'Web',
    "rn_data_liberacao" TIMESTAMP(6) NOT NULL,
    "rn_tipo" VARCHAR(50) NOT NULL DEFAULT E'Problema',

    CONSTRAINT "release_notes_pkey" PRIMARY KEY ("rn_id")
);

-- CreateTable
CREATE TABLE "servidores" (
    "apelido" VARCHAR NOT NULL,
    "producao" SMALLINT NOT NULL DEFAULT 1,
    "host" VARCHAR NOT NULL,
    "name" VARCHAR NOT NULL,
    "pindex" INTEGER NOT NULL DEFAULT 0,
    "port" INTEGER NOT NULL DEFAULT 0,
    "qtd_empresas" INTEGER NOT NULL DEFAULT 0,
    "qtd_veiculos_ativos" INTEGER NOT NULL DEFAULT 0,
    "tipo" VARCHAR NOT NULL DEFAULT E'0',
    "user" VARCHAR NOT NULL,
    "inativo" SMALLINT NOT NULL DEFAULT 0,
    "aws_size_machine" VARCHAR(250),

    CONSTRAINT "servidores_pkey" PRIMARY KEY ("apelido")
);

-- CreateTable
CREATE TABLE "sis00_parametros_padroes" (
    "sis00_id" BIGSERIAL NOT NULL,
    "sis00_label" VARCHAR(100) DEFAULT E'0',
    "sis00_parametro" VARCHAR(100) NOT NULL,
    "sis00_valor" VARCHAR(45) NOT NULL,
    "sis00_descricao" TEXT,
    "sis00_valores_padrao" VARCHAR(100),
    "sis00_tipo" VARCHAR(100),
    "sis00_modulos" VARCHAR(255),
    "sis00_empresas_ids" VARCHAR(45),
    "sis00_valor_instrucoes" VARCHAR(150),

    CONSTRAINT "sis00_parametros_padroes_pkey" PRIMARY KEY ("sis00_id")
);

-- CreateTable
CREATE TABLE "sis00_valor_parametro" (
    "sis00_vp_id" BIGSERIAL NOT NULL,
    "sis00_vp_nome" VARCHAR(100),
    "sis00_vp_itens" VARCHAR(300),
    "sis00_vp_valorreal" VARCHAR(50),

    CONSTRAINT "sis00_valor_parametro_pkey" PRIMARY KEY ("sis00_vp_id")
);

-- CreateTable
CREATE TABLE "sis01_empresa" (
    "sis01_id" BIGSERIAL NOT NULL,
    "sis01_situacao" VARCHAR(100) NOT NULL DEFAULT E'Pendente',
    "sis01_fantasia" VARCHAR(100) NOT NULL,
    "sis01_tipolicenca" VARCHAR(100) NOT NULL DEFAULT E'2',
    "sis01_cnpj" VARCHAR(100) NOT NULL,
    "sis01_validadelicenca" TIMESTAMP(6),
    "sis01_site" VARCHAR(100),
    "sis01_telefone" VARCHAR(100) NOT NULL,
    "sis01_razaosocial" VARCHAR(100) NOT NULL,
    "sis01_endereco" VARCHAR(100),
    "sis01_cidade" VARCHAR(100),
    "sis01_uf" VARCHAR(100),
    "sis01_latitude" DECIMAL(10,5),
    "sis01_longitude" DECIMAL(10,5),
    "sis01_tel_televendas" VARCHAR(100),
    "sis01_senha_ws" VARCHAR(100),
    "sis01_data_ult_integracao" TIMESTAMP(6),
    "sis01_grupo_int_rastreador_atual" BIGINT DEFAULT 0,
    "sis01_max_grupo_int_rastreador" INTEGER DEFAULT 0,
    "sis01_login_rastreador" VARCHAR(100),
    "sis01_senha_rastreador" VARCHAR(65),
    "sis01_email1_notificacao_monitoramento" VARCHAR(200),
    "sis01_email2_notificacao_monitoramento" VARCHAR(200),
    "sis01_email3_notificacao_monitoramento" VARCHAR(200),
    "sis01_email1_notificacao_jornada" VARCHAR(200),
    "sis01_cep" VARCHAR(46),
    "sis01_prod_pontos_por_km" INTEGER DEFAULT 0,
    "sis01_prod_pontos_por_entrega" INTEGER DEFAULT 0,
    "sis01_prod_pontos_por_peso" INTEGER DEFAULT 0,
    "sis01_segmento_cliente" VARCHAR(150) DEFAULT E'0',
    "sis01_data_kickoff" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "sis01_data_fim_projeto" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "sis01_tipo_integracao" VARCHAR(5),
    "sis01_fase_atual" VARCHAR(150) NOT NULL DEFAULT E'0',
    "sis01_implantacao_existe" CHAR(1) DEFAULT E'0',
    "sis01_implantador_id" BIGINT DEFAULT 0,
    "sis01_imei_sms_server" VARCHAR(100),
    "sis01_data_inicio_projeto" DATE,
    "sis01_responsavel1" VARCHAR(100),
    "sis01_responsavel2" VARCHAR(100),
    "sis01_responsavel3" VARCHAR(100),
    "sis01_emailresp1" VARCHAR(100),
    "sis01_emailresp2" VARCHAR(100),
    "sis01_emailresp3" VARCHAR(100),
    "sis01_problema_implantacao" VARCHAR(500),
    "sis01_qtd_veiculos_contratados" INTEGER DEFAULT 0,
    "sis01_user_mantis" VARCHAR(100),
    "sis01_gerente_projeto" VARCHAR(200),
    "sis01_ult_evento_env_ws" BIGINT,
    "sis01_email_gerente_projeto" VARCHAR(200) NOT NULL,
    "sis01_tel_gerente_projeto" VARCHAR(100) NOT NULL,
    "sis01_str_conn_bd" VARCHAR(200),
    "sis01_tipo_erp" VARCHAR(200),
    "sis01_tipo_banco_dados" VARCHAR,
    "sis01_modulos_contratados" VARCHAR(500),
    "sis01_sn_sincronizacao_automatica" CHAR(1) NOT NULL DEFAULT E'N',
    "sis01_bloqueio_integrador" CHAR(1) NOT NULL DEFAULT E'N',
    "sis01_versao_integrador" VARCHAR(10),
    "sis01_data_ult_verifica_desvios" TIMESTAMP(6),
    "sis01_bloqueada" SMALLINT DEFAULT 0,
    "sis01_valor_por_veiculo_contrato" DECIMAL(12,2),
    "sis01_valor_por_veiculo_atual" DECIMAL(12,2),
    "sis01_business_group_id" INTEGER,
    "sis01_email_portal" VARCHAR(255),
    "sis01_senha_portal" VARCHAR(255),
    "sis01_recsenha_token_portal" VARCHAR(100),
    "sis01_default_lang" VARCHAR(5),

    CONSTRAINT "sis01_empresa_pkey" PRIMARY KEY ("sis01_id")
);

-- CreateTable
CREATE TABLE "sis01_empresa_bkpeng4139" (
    "sis01_id" BIGINT,
    "sis01_situacao" VARCHAR(100),
    "sis01_fantasia" VARCHAR(100),
    "sis01_tipolicenca" VARCHAR(100),
    "sis01_cnpj" VARCHAR(100),
    "sis01_validadelicenca" TIMESTAMP(6),
    "sis01_site" VARCHAR(100),
    "sis01_telefone" VARCHAR(100),
    "sis01_razaosocial" VARCHAR(100),
    "sis01_endereco" VARCHAR(100),
    "sis01_cidade" VARCHAR(100),
    "sis01_uf" VARCHAR(100),
    "sis01_latitude" DECIMAL(10,5),
    "sis01_longitude" DECIMAL(10,5),
    "sis01_tel_televendas" VARCHAR(100),
    "sis01_senha_ws" VARCHAR(100),
    "sis01_data_ult_integracao" TIMESTAMP(6),
    "sis01_grupo_int_rastreador_atual" BIGINT,
    "sis01_max_grupo_int_rastreador" INTEGER,
    "sis01_login_rastreador" VARCHAR(100),
    "sis01_senha_rastreador" VARCHAR(65),
    "sis01_email1_notificacao_monitoramento" VARCHAR(200),
    "sis01_email2_notificacao_monitoramento" VARCHAR(200),
    "sis01_email3_notificacao_monitoramento" VARCHAR(200),
    "sis01_email1_notificacao_jornada" VARCHAR(200),
    "sis01_cep" VARCHAR(46),
    "sis01_prod_pontos_por_km" INTEGER,
    "sis01_prod_pontos_por_entrega" INTEGER,
    "sis01_prod_pontos_por_peso" INTEGER,
    "sis01_segmento_cliente" VARCHAR(150),
    "sis01_data_kickoff" TIMESTAMP(6),
    "sis01_data_fim_projeto" TIMESTAMP(6),
    "sis01_tipo_integracao" VARCHAR(5),
    "sis01_fase_atual" VARCHAR(150),
    "sis01_implantacao_existe" CHAR(1),
    "sis01_implantador_id" BIGINT,
    "sis01_imei_sms_server" VARCHAR(100),
    "sis01_data_inicio_projeto" DATE,
    "sis01_responsavel1" VARCHAR(100),
    "sis01_responsavel2" VARCHAR(100),
    "sis01_responsavel3" VARCHAR(100),
    "sis01_emailresp1" VARCHAR(100),
    "sis01_emailresp2" VARCHAR(100),
    "sis01_emailresp3" VARCHAR(100),
    "sis01_problema_implantacao" VARCHAR(500),
    "sis01_qtd_veiculos_contratados" INTEGER,
    "sis01_user_mantis" VARCHAR(100),
    "sis01_gerente_projeto" VARCHAR(200),
    "sis01_ult_evento_env_ws" BIGINT,
    "sis01_email_gerente_projeto" VARCHAR(200),
    "sis01_tel_gerente_projeto" VARCHAR(100),
    "sis01_str_conn_bd" VARCHAR(200),
    "sis01_tipo_erp" VARCHAR(200),
    "sis01_tipo_banco_dados" VARCHAR,
    "sis01_modulos_contratados" VARCHAR(500),
    "sis01_sn_sincronizacao_automatica" CHAR(1),
    "sis01_bloqueio_integrador" CHAR(1),
    "sis01_versao_integrador" VARCHAR(10),
    "sis01_data_ult_verifica_desvios" TIMESTAMP(6),
    "sis01_bloqueada" SMALLINT,
    "sis01_valor_por_veiculo_contrato" DECIMAL(12,2),
    "sis01_valor_por_veiculo_atual" DECIMAL(12,2),
    "sis01_business_group_id" INTEGER
);

-- CreateTable
CREATE TABLE "sis01_parametros" (
    "sis01_id" BIGSERIAL NOT NULL,
    "sis01_empresa_id" BIGINT NOT NULL,
    "sis01_parametro_id" BIGINT NOT NULL,
    "sis01_valor" TEXT NOT NULL,
    "sis01_usuario_id" BIGINT,
    "sis01_filial_id" BIGINT,

    CONSTRAINT "sis01_parametros_pkey" PRIMARY KEY ("sis01_id")
);

-- CreateTable
CREATE TABLE "sis02_modulo" (
    "sis02_id" BIGSERIAL NOT NULL,
    "sis02_nome" VARCHAR(45) NOT NULL,
    "sis02_mainpage_id" BIGINT NOT NULL,

    CONSTRAINT "sis02_modulo_pkey" PRIMARY KEY ("sis02_id")
);

-- CreateTable
CREATE TABLE "sis03_modulo_empresa" (
    "sis03_id" BIGSERIAL NOT NULL,
    "sis03_modulo_id" BIGINT NOT NULL,
    "sis03_empresa_id" BIGINT NOT NULL,

    CONSTRAINT "sis03_modulo_empresa_pkey" PRIMARY KEY ("sis03_id")
);

-- CreateTable
CREATE TABLE "sis03_modulo_empresa_bkpeng4139" (
    "sis03_id" BIGINT,
    "sis03_modulo_id" BIGINT,
    "sis03_empresa_id" BIGINT
);

-- CreateTable
CREATE TABLE "sis04_menu" (
    "sis04_id" BIGSERIAL NOT NULL,
    "sis04_ordem" BIGINT NOT NULL,
    "sis04_nome" VARCHAR(100) NOT NULL,
    "sis04_codigo" VARCHAR(45) NOT NULL,
    "sis04_html_help" VARCHAR(100) NOT NULL,
    "sis04_modulo_id" BIGINT NOT NULL,
    "sis04_html_interno" VARCHAR(200) NOT NULL,
    "sis04_descricao" TEXT NOT NULL,
    "sis04_grupo_menu_id" BIGINT DEFAULT 0,
    "sis04_sn_utiliza_google_maps" CHAR(1) NOT NULL DEFAULT E'S',
    "sis04_qtd_dias_atv" BIGINT,
    "sis04_atv_pre_req" VARCHAR(45),
    "sis04_responsavel" TEXT,
    "sis04_detalhes_atv" TEXT,
    "sis04_url_material" TEXT,

    CONSTRAINT "sis04_menu_pkey" PRIMARY KEY ("sis04_id")
);

-- CreateTable
CREATE TABLE "sis05_menu_dependencias" (
    "sis05_id" BIGSERIAL NOT NULL,
    "sis05_menu_id" BIGINT NOT NULL,
    "sis05_arquivo" VARCHAR(100) NOT NULL,
    "sis05_versao" VARCHAR(150),
    "sis05_tipo" VARCHAR(45) NOT NULL,
    "sis05_ordem" INTEGER NOT NULL,

    CONSTRAINT "sis05_menu_dependencias_pkey" PRIMARY KEY ("sis05_id")
);

-- CreateTable
CREATE TABLE "sis06_menu_funcoes" (
    "sis06_id" BIGSERIAL NOT NULL,
    "sis06_menu_id" BIGINT NOT NULL,
    "sis06_funcao" VARCHAR(151) NOT NULL,
    "sis06_sn_acesso" CHAR(1) NOT NULL DEFAULT E'S',
    "sis06_texto_help" TEXT,
    "sis06_sn_acompanha_mouse_help" CHAR(1),
    "sis06_posicao_help" VARCHAR(45),
    "sis06_id_componente" VARCHAR(45),
    "sis06_id_tela" VARCHAR(50),
    "sis06_ordem_tela" VARCHAR(50),

    CONSTRAINT "sis06_menu_funcoes_pkey" PRIMARY KEY ("sis06_id")
);

-- CreateTable
CREATE TABLE "sis07_grupo_menu" (
    "sis07_id" BIGSERIAL NOT NULL,
    "sis07_modulo_id" BIGINT NOT NULL,
    "sis07_nome" VARCHAR(100) NOT NULL,
    "sis07_icon" VARCHAR(45) NOT NULL,
    "sis07_ordem" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "sis07_grupo_menu_pkey" PRIMARY KEY ("sis07_id")
);

-- CreateTable
CREATE TABLE "sis114_licenca" (
    "sis114_id" BIGSERIAL NOT NULL,
    "sis114_tipo" VARCHAR NOT NULL,
    "sis114_empresa_id" BIGINT NOT NULL,
    "sis114_data_hora_expiracao" TIMESTAMP(6),
    "sis114_data_hora_atualizacao" TIMESTAMP(6),
    "sis114_usuario_id_atualizacao" BIGINT,
    "sis114_data_hora_cadastro" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "sis114_usuario_id_cadastro" BIGINT NOT NULL,

    CONSTRAINT "sis114_licenca_pkey" PRIMARY KEY ("sis114_id")
);

-- CreateTable
CREATE TABLE "sis116_business_group" (
    "sis116_id" BIGSERIAL NOT NULL,
    "sis116_name" VARCHAR(255) NOT NULL,
    "sis116_active" SMALLINT NOT NULL DEFAULT 1,

    CONSTRAINT "sis116_business_group_pkey" PRIMARY KEY ("sis116_id")
);

-- CreateTable
CREATE TABLE "subdistrito" (
    "id" BIGSERIAL NOT NULL,
    "bairro_id" BIGINT NOT NULL,
    "limites" TEXT,
    "ibge_id" BIGINT,

    CONSTRAINT "subdistrito_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "t02_usuario" (
    "t02_id" BIGSERIAL NOT NULL,
    "t02_descricao" VARCHAR NOT NULL,
    "t02_tipo" VARCHAR NOT NULL,
    "t02_login" VARCHAR NOT NULL,
    "t02_senha" VARCHAR NOT NULL,
    "t02_empresa_id" BIGINT,
    "t02_perfil_id" BIGINT,
    "t02_codigo_erp" VARCHAR,
    "t02_email" TEXT,
    "t02_telefone" VARCHAR,
    "t02_sn_exibe_help_campos" CHAR(1) NOT NULL DEFAULT E'S',
    "t02_googleapi" VARCHAR DEFAULT E'P',
    "t02_primeiro_acesso" CHAR(1) DEFAULT E'S',
    "t02_ordem_colunas_form_cargas" TEXT,
    "t02_data_hora_atualizacao" TIMESTAMP(6),
    "t02_filial_expedicao_padrao" BIGINT,
    "t02_filiais_fatura_padrao" VARCHAR,
    "t02_situacao" BIGINT DEFAULT 1,
    "t02_faixa_valor" VARCHAR,
    "t02_habilita_botao_ped_formar_carga" CHAR(1) NOT NULL DEFAULT E'N',
    "t02_lang_user" VARCHAR(5),
    "t02_envia_email_data_sincronizacao" CHAR(1) NOT NULL DEFAULT E'N',
    "t02_perfil_transportadora" CHAR(1) NOT NULL DEFAULT E'N',

    CONSTRAINT "t02_usuario_pkey" PRIMARY KEY ("t02_id")
);

-- CreateTable
CREATE TABLE "t02_usuario_bkpeng4139" (
    "t02_id" BIGINT,
    "t02_descricao" VARCHAR,
    "t02_tipo" VARCHAR,
    "t02_login" VARCHAR,
    "t02_senha" VARCHAR,
    "t02_empresa_id" BIGINT,
    "t02_perfil_id" BIGINT,
    "t02_codigo_erp" VARCHAR,
    "t02_email" TEXT,
    "t02_telefone" VARCHAR,
    "t02_sn_exibe_help_campos" CHAR(1),
    "t02_googleapi" VARCHAR,
    "t02_primeiro_acesso" CHAR(1),
    "t02_ordem_colunas_form_cargas" TEXT,
    "t02_data_hora_atualizacao" TIMESTAMP(6),
    "t02_filial_expedicao_padrao" BIGINT,
    "t02_filiais_fatura_padrao" VARCHAR,
    "t02_situacao" BIGINT,
    "t02_faixa_valor" VARCHAR,
    "t02_habilita_botao_ped_formar_carga" CHAR(1)
);

-- CreateTable
CREATE TABLE "t124_config_rastreador" (
    "t124_id" BIGSERIAL NOT NULL,
    "t124_apelido_bd" VARCHAR NOT NULL,
    "t124_nome" VARCHAR(45) NOT NULL,
    "t124_empresa_config" TEXT,

    CONSTRAINT "t124_config_rastreador_pkey" PRIMARY KEY ("t124_apelido_bd","t124_id")
);

-- CreateTable
CREATE TABLE "t162_fila_processamento_integracao" (
    "t162_id" SERIAL NOT NULL,
    "t162_empresa_id" INTEGER NOT NULL,
    "t162_status" VARCHAR DEFAULT E'N',
    "t162_nome_arquivo" VARCHAR NOT NULL,
    "t162_nota_fiscal" VARCHAR NOT NULL,
    "t162_data_registro" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "t162_data_finalizado" TIMESTAMP(6),
    "t162_alias_base" VARCHAR NOT NULL,
    "t162_obs" TEXT,

    CONSTRAINT "t162_fila_processamento_integracao_pkey" PRIMARY KEY ("t162_id")
);

-- CreateTable
CREATE TABLE "t16_cliente" (
    "t16_id" BIGSERIAL NOT NULL,
    "t16_apelido_bd" VARCHAR(100) NOT NULL DEFAULT E'INTERNO',
    "t16_fantasia" VARCHAR(45),
    "t16_razsocial" VARCHAR(45) NOT NULL,
    "t16_cnpjcliente" VARCHAR(45) NOT NULL,
    "t16_endereco" VARCHAR(255) NOT NULL,
    "t16_uf" VARCHAR(45) NOT NULL,
    "t16_cidade" VARCHAR(45) NOT NULL,
    "t16_cep" VARCHAR(10) NOT NULL,
    "t16_longitude" DOUBLE PRECISION,
    "t16_latitude" DOUBLE PRECISION,
    "t16_local_confirmado" CHAR(1) NOT NULL DEFAULT E'N',
    "t16_bairro" VARCHAR(45),
    "t16_email1" VARCHAR(100),
    "t16_email2" VARCHAR(100),
    "t16_email3" VARCHAR(100),
    "t16_telefone_fixo1" VARCHAR(45),
    "t16_telefone_fixo2" VARCHAR(45),
    "t16_celular" VARCHAR(45),
    "t16_senha_portal" VARCHAR(45),
    "t16_sn_verificado_sefaz" CHAR(1) NOT NULL DEFAULT E'N',
    "t16_inscricao_estadual" VARCHAR(45),
    "t16_data_inicio_atividades" DATE,
    "t16_regime_apuracao" VARCHAR(45),
    "t16_cnae" VARCHAR(45),
    "t16_numero_endereco" VARCHAR(45),
    "t16_consta_cadastro_sefaz" CHAR(1),
    "t16_municipio_id" BIGINT,
    "t16_fax" VARCHAR(45),
    "t16_tipo_pessoa" VARCHAR(45),
    "t16_sexo" VARCHAR(45),
    "t16_estado_civil" VARCHAR(45),
    "t16_utiliza_insc_estadual" VARCHAR(45),
    "t16_inscricao_municipal" VARCHAR(45),
    "t16_referencia_para_entrega" VARCHAR(45),
    "t16_data_hora_atualizacao" TIMESTAMP(6) DEFAULT CURRENT_TIMESTAMP,
    "t16_qualidade_geocod" SMALLINT NOT NULL DEFAULT 0,
    "t16_origem_geocodificacao" VARCHAR DEFAULT E'Base de Conhecimento (I)',

    CONSTRAINT "t16_cliente_pkey" PRIMARY KEY ("t16_apelido_bd","t16_id")
);

-- CreateTable
CREATE TABLE "t44_cliente_empresa" (
    "t44_apelido_bd" VARCHAR NOT NULL,
    "t44_empresa_id" BIGINT NOT NULL,
    "t44_cliente_id" BIGINT NOT NULL,
    "t44_max_id" BIGINT NOT NULL,
    "t44_data_hora_atualizacao" TIMESTAMP(6),
    "t44_cnpj_cliente" VARCHAR(45),
    "t44_dthr_atualizacao_min_med_entrega" TIMESTAMP(6),
    "t44_origem_geocodificacao" VARCHAR DEFAULT E'Base de Conhecimento (I)',
    "t44_data_sincronizacao" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "t44_cliente_empresa_pkey" PRIMARY KEY ("t44_apelido_bd","t44_empresa_id","t44_cliente_id")
);

-- CreateIndex
CREATE INDEX "idx_clientes_cep_latitude_longitude" ON "clientes"("cep", "longitude", "latitude");

-- CreateIndex
CREATE INDEX "idx_clientes_fantasia" ON "clientes"("fantasia");

-- CreateIndex
CREATE INDEX "idx_clientes_local_confirmado_id" ON "clientes"("local_confirmado");

-- CreateIndex
CREATE INDEX "idx_ativo_executor" ON "config_desvios"("executor", "ativo");

-- CreateIndex
CREATE INDEX "idx_log01_empresa" ON "log01_exclusao_ids_tabela"("log01_id_empresa");

-- CreateIndex
CREATE INDEX "idx_log01_empresa_tabela" ON "log01_exclusao_ids_tabela"("log01_id_empresa", "log01_tabela");

-- CreateIndex
CREATE INDEX "idx_log01_empresa_tabela_dia" ON "log01_exclusao_ids_tabela"("log01_id_empresa", "log01_tabela", "log01_data_hora");

-- CreateIndex
CREATE INDEX "idx_log01_empresa_tabela_id" ON "log01_exclusao_ids_tabela"("log01_id_empresa", "log01_tabela", "log01_id_removido");

-- CreateIndex
CREATE UNIQUE INDEX "ui_exclusao_id" ON "log01_exclusao_ids_tabela"("log01_apelido_bd", "log01_id_empresa", "log01_tabela", "log01_id_removido");

-- CreateIndex
CREATE INDEX "idx_log_erro_importacao1" ON "log_erro_importacao"("nome_tabela", "data_hora");

-- CreateIndex
CREATE INDEX "idx_log_erro_importacao2" ON "log_erro_importacao"("nome_tabela");

-- CreateIndex
CREATE INDEX "idx_log_seq_cli_emp_cli_ant_tipo" ON "log_sequenciamento_cliente"("empresa", "tipo_agrupamento", "cliente_id", "cliente_id_anterior");

-- CreateIndex
CREATE INDEX "idx_log_seq_cli_emp_cli_ant_tipo_data" ON "log_sequenciamento_cliente"("empresa", "tipo_agrupamento", "cliente_id", "cliente_id_anterior", "data_hora");

-- CreateIndex
CREATE INDEX "idx_log_seq_cli_emp_cli_tipo_data" ON "log_sequenciamento_cliente"("empresa", "tipo_agrupamento", "cliente_id", "data_hora");

-- CreateIndex
CREATE INDEX "idx_log_seq_cli_emp_tipo" ON "log_sequenciamento_cliente"("empresa", "tipo_agrupamento", "cliente_id");

-- CreateIndex
CREATE INDEX "idx_pc01_parameters_name" ON "pc01_parameters"("pc01_name");

-- CreateIndex
CREATE INDEX "idx_cpf" ON "pc02_parameters_clients"("pc02_client_cnpj");

-- CreateIndex
CREATE INDEX "idx_pc02_parameters_clients_cpf_parameter_name" ON "pc02_parameters_clients"("pc02_client_cnpj", "pc02_parameter_name");

-- CreateIndex
CREATE INDEX "idx_pc02_parameters_clients_parameter_name" ON "pc02_parameters_clients"("pc02_parameter_name");

-- CreateIndex
CREATE INDEX "idx_sis00_parametros_padroes_txt" ON "sis00_parametros_padroes"("sis00_parametro");

-- CreateIndex
CREATE INDEX "Index_2" ON "sis01_empresa"("sis01_id", "sis01_senha_ws");

-- CreateIndex
CREATE INDEX "idx_cnpj_senha" ON "sis01_empresa"("sis01_cnpj", "sis01_senha_ws");

-- CreateIndex
CREATE INDEX "idx_id_bloqueada" ON "sis01_empresa"("sis01_id", "sis01_bloqueada");

-- CreateIndex
CREATE INDEX "idx_id_bloqueada_connbd" ON "sis01_empresa"("sis01_id", "sis01_bloqueada", "sis01_str_conn_bd");

-- CreateIndex
CREATE INDEX "idx_empresa_parametroid" ON "sis01_parametros"("sis01_empresa_id", "sis01_parametro_id");

-- CreateIndex
CREATE INDEX "sis01_idx_empresa" ON "sis01_parametros"("sis01_empresa_id");

-- CreateIndex
CREATE UNIQUE INDEX "sis01_idx_empresa_filial_parametro" ON "sis01_parametros"("sis01_empresa_id", "sis01_filial_id", "sis01_parametro_id");

-- CreateIndex
CREATE UNIQUE INDEX "sis01_idx_unq_empresa_parametro" ON "sis01_parametros"("sis01_empresa_id", "sis01_parametro_id");

-- CreateIndex
CREATE UNIQUE INDEX "sis01_parametros_sis01_empresa_id_sis01_parametro_id_key" ON "sis01_parametros"("sis01_empresa_id", "sis01_parametro_id");

-- CreateIndex
CREATE INDEX "sis02_modulo_1" ON "sis02_modulo"("sis02_mainpage_id");

-- CreateIndex
CREATE INDEX "sis03_idx_empresa" ON "sis03_modulo_empresa"("sis03_empresa_id");

-- CreateIndex
CREATE INDEX "is04_menu_1" ON "sis04_menu"("sis04_modulo_id");

-- CreateIndex
CREATE INDEX "fk_sis06_menu_funcoes_1" ON "sis06_menu_funcoes"("sis06_menu_id");

-- CreateIndex
CREATE INDEX "idx_sis114_empresa_data_expiracao" ON "sis114_licenca"("sis114_empresa_id", "sis114_data_hora_expiracao");

-- CreateIndex
CREATE INDEX "idx_sis114_empresa_tipo" ON "sis114_licenca"("sis114_empresa_id", "sis114_tipo");

-- CreateIndex
CREATE INDEX "idx_sis114_empresa_tipo_data_expiracao" ON "sis114_licenca"("sis114_empresa_id", "sis114_tipo", "sis114_data_hora_expiracao");

-- CreateIndex
CREATE UNIQUE INDEX "ui_login" ON "t02_usuario"("t02_login");

-- CreateIndex
CREATE INDEX "t162_empresa_id_t162_data_finalizado_t162_status" ON "t162_fila_processamento_integracao"("t162_empresa_id", "t162_data_finalizado", "t162_status");

-- CreateIndex
CREATE INDEX "t162_empresa_id_t162_data_registro_t162_status" ON "t162_fila_processamento_integracao"("t162_empresa_id", "t162_data_registro", "t162_status");

-- CreateIndex
CREATE INDEX "t162_empresa_id_t162_status" ON "t162_fila_processamento_integracao"("t162_empresa_id", "t162_status");

-- CreateIndex
CREATE INDEX "btree_idx_t16_cnpjcliente" ON "t16_cliente"("t16_cnpjcliente");

-- CreateIndex
CREATE INDEX "btree_idx_t16_data_hora_atualizacao" ON "t16_cliente"("t16_data_hora_atualizacao");

-- CreateIndex
CREATE INDEX "cnpj" ON "t16_cliente"("t16_cnpjcliente");

-- CreateIndex
CREATE INDEX "idx_t16_cep_apelidobd" ON "t16_cliente"("t16_apelido_bd", "t16_cep");

-- CreateIndex
CREATE INDEX "idx_t16_cliente_cep" ON "t16_cliente"("t16_cep");

-- CreateIndex
CREATE INDEX "idx_t16_cliente_fantasia" ON "t16_cliente"("t16_fantasia");

-- CreateIndex
CREATE INDEX "idx_t16_cliente_local_confirmado_id" ON "t16_cliente"("t16_local_confirmado", "t16_apelido_bd");

-- CreateIndex
CREATE INDEX "idx_t16_cliente_t16_id" ON "t16_cliente"("t16_id");

-- CreateIndex
CREATE INDEX "trgm_idx_t16_cnpjcliente" ON "t16_cliente"("t16_cnpjcliente");

-- CreateIndex
CREATE INDEX "idx_empresa" ON "t44_cliente_empresa"("t44_empresa_id");

-- AddForeignKey
ALTER TABLE "bairros" ADD CONSTRAINT "FK_cidade_bairro" FOREIGN KEY ("cidade_id") REFERENCES "cidades"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sis03_modulo_empresa" ADD CONSTRAINT "fk_sis03_modulo_empresa_2" FOREIGN KEY ("sis03_empresa_id") REFERENCES "sis01_empresa"("sis01_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sis03_modulo_empresa" ADD CONSTRAINT "fk_sis03_modulo_empresa_1" FOREIGN KEY ("sis03_modulo_id") REFERENCES "sis02_modulo"("sis02_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sis05_menu_dependencias" ADD CONSTRAINT "fk_sis05_menu_dependencias_1" FOREIGN KEY ("sis05_menu_id") REFERENCES "sis04_menu"("sis04_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sis06_menu_funcoes" ADD CONSTRAINT "fk_sis06_menu_funcoes" FOREIGN KEY ("sis06_menu_id") REFERENCES "sis04_menu"("sis04_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "subdistrito" ADD CONSTRAINT "FK_bairro_subdistrito" FOREIGN KEY ("bairro_id") REFERENCES "bairros"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "t02_usuario" ADD CONSTRAINT "fk_t02_usuario_1" FOREIGN KEY ("t02_empresa_id") REFERENCES "sis01_empresa"("sis01_id") ON DELETE RESTRICT ON UPDATE CASCADE;
