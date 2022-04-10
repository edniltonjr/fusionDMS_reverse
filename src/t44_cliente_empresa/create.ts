import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();


async function main() {
    const result = await prisma.t44_cliente_empresa.createMany({
        data:
            [
                {
                    t44_apelido_bd: 'CARDEAL',
                    t44_empresa_id: 271,
                    t44_cliente_id: 34935,
                    t44_max_id: 1087565,
                    t44_cnpj_cliente: '10144076000144',
                    t44_dthr_atualizacao_min_med_entrega: null,
                    t44_origem_geocodificacao: 'Base de Conhecimento (I)',
                },
                {
                    t44_apelido_bd: 'CARDEAL',
                    t44_empresa_id: 271,
                    t44_cliente_id: 37836,
                    t44_max_id: 589582,
                    t44_data_hora_atualizacao: null,
                    t44_cnpj_cliente: '12997775000162',
                    t44_dthr_atualizacao_min_med_entrega: null,
                    t44_origem_geocodificacao: 'Base de Conhecimento (I)',
                },
                {
                    t44_apelido_bd: 'CARDEAL',
                    t44_empresa_id: 271,
                    t44_cliente_id: 40681,
                    t44_max_id: 592959,
                    t44_data_hora_atualizacao: null,
                    t44_cnpj_cliente: '87556650000520',
                    t44_dthr_atualizacao_min_med_entrega: null,
                    t44_origem_geocodificacao: 'Base de Conhecimento (I)',
                },
                {
                    t44_apelido_bd: 'CARDEAL',
                    t44_empresa_id: 271,
                    t44_cliente_id: 42025,
                    t44_max_id: 681083,
                    t44_data_hora_atualizacao: null,
                    t44_cnpj_cliente: '35820448000640',
                    t44_dthr_atualizacao_min_med_entrega: null,
                    t44_origem_geocodificacao: 'Base de Conhecimento (I)',
                },
                {
                    t44_apelido_bd: 'CARDEAL',
                    t44_empresa_id: 271,
                    t44_cliente_id: 42558,
                    t44_max_id: 591435,
                    t44_data_hora_atualizacao: null,
                    t44_cnpj_cliente: '94679479002555',
                    t44_dthr_atualizacao_min_med_entrega: null,
                    t44_origem_geocodificacao: 'Base de Conhecimento (I)',
                },
                {
                    t44_apelido_bd: 'CARDEAL',
                    t44_empresa_id: 271,
                    t44_cliente_id: 70138,
                    t44_max_id: 1031848,
                    t44_cnpj_cliente: '48740351000165',
                    t44_dthr_atualizacao_min_med_entrega: null,
                    t44_origem_geocodificacao: 'Base de Conhecimento (I)',
                },
                {
                    t44_apelido_bd: 'CARDEAL',
                    t44_empresa_id: 271,
                    t44_cliente_id: 71372,
                    t44_max_id: 580776,
                    t44_data_hora_atualizacao: null,
                    t44_cnpj_cliente: '57265977000158',
                    t44_dthr_atualizacao_min_med_entrega: null,
                    t44_origem_geocodificacao: 'Base de Conhecimento (I)',
                },
                {
                    t44_apelido_bd: 'CARDEAL',
                    t44_empresa_id: 271,
                    t44_cliente_id: 71373,
                    t44_max_id: 585989,
                    t44_data_hora_atualizacao: null,
                    t44_cnpj_cliente: '10970887000870',
                    t44_dthr_atualizacao_min_med_entrega: null,
                    t44_origem_geocodificacao: 'Base de Conhecimento (I)',
                },
                {
                    t44_apelido_bd: 'CARDEAL',
                    t44_empresa_id: 271,
                    t44_cliente_id: 72059,
                    t44_max_id: 580633,
                    t44_data_hora_atualizacao: null,
                    t44_cnpj_cliente: '62379037000120',
                    t44_dthr_atualizacao_min_med_entrega: null,
                    t44_origem_geocodificacao: 'Base de Conhecimento (I)',
                },
                {
                    t44_apelido_bd: 'CARDEAL',
                    t44_empresa_id: 271,
                    t44_cliente_id: 72258,
                    t44_max_id: 586008,
                    t44_data_hora_atualizacao: null,
                    t44_cnpj_cliente: '36176600000152',
                    t44_dthr_atualizacao_min_med_entrega: null,
                    t44_origem_geocodificacao: 'Base de Conhecimento (I)',
                }
            ]
    })
    console.log(result)
}

main();