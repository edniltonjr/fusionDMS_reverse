import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();


async function main() {
    console.log(`Start seeding ...`)
    const result = await prisma.sis01_empresa.create({
        data: {
            sis01_id: 271,
            sis01_situacao: 'Em Projeto Ativo',
            sis01_fantasia: 'rioquality',
            sis01_tipolicenca: '1',
            sis01_cnpj: '8969770000159',
            sis01_site: '',
            sis01_telefone: '',
            sis01_razaosocial: 'RIO QUALITY COMERCIO DE ALIMENTOS LTDA',
            sis01_endereco: 'R Herculano Pinheiro, 1045 - Pavuna',
            sis01_cidade: 'RIO DE JANEIRO',
            sis01_uf: 'RJ',
            sis01_latitude: -22.81542,
            sis01_longitude: -43.35141,
            sis01_tel_televendas: '',
            sis01_senha_ws: 'rioquality!@#',
            sis01_grupo_int_rastreador_atual: 0,
            sis01_max_grupo_int_rastreador: 0,
            sis01_login_rastreador: '',
            sis01_senha_rastreador: '',
            sis01_email1_notificacao_monitoramento: '',
            sis01_email2_notificacao_monitoramento: '',
            sis01_email3_notificacao_monitoramento: '',
            sis01_email1_notificacao_jornada: '',
            sis01_cep: ' 21532-440',
            sis01_prod_pontos_por_km: null,
            sis01_prod_pontos_por_entrega: null,
            sis01_prod_pontos_por_peso: null,
            sis01_segmento_cliente: 'AlimentÃ\x83Â­cio',
            sis01_tipo_integracao: 'I',
            sis01_fase_atual: 'Em projeto',
            sis01_implantacao_existe: 'N',
            sis01_implantador_id: 0,
            sis01_imei_sms_server: '',
            sis01_responsavel1: '',
            sis01_responsavel2: '',
            sis01_responsavel3: '',
            sis01_emailresp1: '',
            sis01_emailresp2: '',
            sis01_emailresp3: '',
            sis01_problema_implantacao: '',
            sis01_qtd_veiculos_contratados: 45,
            sis01_user_mantis: '',
            sis01_gerente_projeto: 'Sr. JULIO ',
            sis01_ult_evento_env_ws: null,
            sis01_email_gerente_projeto: 'ficticio@rioquality.com.br ',
            sis01_tel_gerente_projeto: '',
            sis01_str_conn_bd: 'fusiondb-003-mysql.cyek5oxll00n.us-west-2.rds.amazonaws.com',
            sis01_tipo_erp: 'ConCinco',
            sis01_tipo_banco_dados: 'Oracle',
            sis01_modulos_contratados: '',
            sis01_sn_sincronizacao_automatica: 'S',
            sis01_bloqueio_integrador: 'N',
            sis01_versao_integrador: '13.9.0.0',
            sis01_data_ult_verifica_desvios: new Date(),
            sis01_bloqueada: 0,
            sis01_valor_por_veiculo_contrato: null,
            sis01_valor_por_veiculo_atual: 76.5,
            sis01_business_group_id: null,
            sis01_email_portal: 'megahelp.tutoriais@gmail.com',
            sis01_senha_portal: '1234',
            sis01_recsenha_token_portal: null,
            sis01_default_lang: null

        }
    })
    console.log(result)
}

main();