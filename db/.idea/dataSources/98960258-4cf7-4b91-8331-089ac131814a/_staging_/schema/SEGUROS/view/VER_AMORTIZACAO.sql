create or REPLACE view VER_AMORTIZACAO as
SELECT
      AM.AMORT_ID AS "ID AMORTIZACAO",
      CT.CTT_ID  AS "ID CONTRATO",
      CT.CTT_NUMAPOLICE AS "APOLICA",
      CT.CTT_DTREG AS "DATA REG APOLICE",
      CT.CTT_EXTERNALCOD AS "NUM REGISTRO",
      PRT.PREST_ID AS "ID PRESTACAO",
      CT.CTT_OBS AS "ACCESSORIO",
      CL.CLI_ID AS "ID CLIENTE",
      (SELECT COUNT(*) FROM T_ASSEGURA WHERE CT.CTT_ID = T_ASSEGURA.ASE_CTT_ID) AS "ASEGURADO",
      ICONSUMO.IMPTAX_PERCENTAGEM AS "IMPOSTO CONSUMO",
      ISELO.IMPTAX_PERCENTAGEM AS "IMPOSTO SELO",
      'Não sei o que é' AS "MOTOR FOUND",
      CT.CTT_VPAGAR AS "TOTAL",
      'Não sei o que é' AS EFEITO,
      CT.CTT_DTFIM AS "VENCIMENTO",
      CASE
         WHEN CL.CLI_TCLI_ID = 1 THEN  CL.CLI_NOME || ' '||CL.CLI_APELIDO 
         ELSE CL.CLI_NOME
      END AS "CLIENTE",
      TPAY.OBJT_DESC AS "TIPO PAGAMENTO",
      AM.AMORT_DOCUMENTO AS "DOCUMENTO AMORTIZACAO",
      'SIGLA' /*BK.BK_SIGLA*/ AS  "BANCO",
      AC."NUMBER" AS "COATA",
      MD.MOE_NOME AS "NOME MOEDA",
      MD.MOE_SIGLA AS "SIGLA MOEDA",
      MD.MOE_ID AS "ID MOEDA",
      /*TAX.TX_COMPRA*/1 AS "TAXA COMPRA",
      /*TAX.TX_VENDA*/1 AS "TAXA VENDA",
      PRT.PREST_VALOR AS "VALOR PRESTACAO",
      AM.AMORT_VALOR AS "VALOR AMORTIZADO",
      AM.AMORT_DTREG AS "REGISTRO AMORTIZACAO",
      CT.CTT_PBRUTO AS "TOTAL BRUTO",
      AM.AMORT_DTREG AS DATA
      
   FROM T_AMORTIZACAO AM 
      INNER JOIN T_PRESTACAO PRT ON AM.AMORT_PREST_ID = PRT.PREST_ID 
      INNER JOIN T_CONTRATO CT ON PRT.PREST_CTT_ID = CT.CTT_ID
      INNER JOIN T_IMPOSTOTAXA ISELO ON CT.CTT_IMPTAX_SELO = ISELO.IMPTAX_ID
      INNER JOIN T_IMPOSTOTAXA ICONSUMO ON CT.CTT_IMPTAX_CONSUMO = ICONSUMO.IMPTAX_ID
      INNER JOIN T_CLIENTE CL ON CT.CTT_CLI_ID = CL.CLI_ID
      INNER JOIN VER_ACCOUNT AC ON AM.AMORT_ACCOUNT_ID = AC.ID
      -- LEFT JOIN T_BANK BK ON AC.COUNT_BK_ID = BK.BK_ID
      INNER JOIN T_OBJECTYPE TPAY ON AM.AMORT_OBJT_ID = TPAY.OBJT_ID
      INNER JOIN T_MOEDA MD ON CT.CTT_MOE_ID = MD.MOE_ID
      -- INNER JOIN TABLE(PACK_CONTA.GETTAXADAY(AM.AMORT_DTREG, MD.MOE_ID)) TAX ON MD.MOE_ID = TAX.TX_MOE_BASE