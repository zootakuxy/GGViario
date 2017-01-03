create view VER_CONTA_MOVIMENTO_LANCAMENTO as
SELECT ILANCA.LANCACOUNT_ID AS "ID",
         ILANCA.LANCACOUNT_DOCNUM AS "DOCUMENTO",
         ILANCA.LANCACOUNT_VALUE AS "VALOR",
         ILANCA.LANCACOUNT_VALUESTD AS "VALOR STD",
         TMOV.TMOV_OPERACTION AS "MOVIMENTACAO",
         AC.COD AS "CONTA",
         ILANCA.LANCACOUNT_MOVDESC AS "OBSERVACAO",
         TO_CHAR(LANCA.LANCA_DATA, 'DD-MM-YYYY') AS "DATA",
         TO_CHAR(ILANCA.LANCACOUNT_DTREG, 'DD-MM-YYYY') AS "REGISTRO",
         FU.FUNC_NOME AS "COLABORADOR",
         'Lancamento' AS "OPERACAO",
         'L' AS "OP",
         ILANCA.LANCACOUNT_TMOV_ID AS "TP MOV",
         ILANCA.LANCACOUNT_ACCOUNT_ID AS "ID CONTA",
         LANCA.LANCA_DATA AS "DATA_SF",
         ILANCA.LANCACOUNT_DTREG AS "REGISTRO_SF",
         ILANCA.LANCACOUNT_LANCA_ID AS "ID LANCAMENTO",
         
         
         CASE
            WHEN TMOV.TMOV_ID = 1 THEN ILANCA.LANCACOUNT_VALUE
            ELSE 0 
         END AS "DEBITO",
         
         CASE
            WHEN TMOV.TMOV_ID = 2 THEN ILANCA.LANCACOUNT_VALUE
            ELSE 0 
         END AS "CREDITO",
         
         MD.MOE_SIGLA AS "MOEDA",
         MD.MOE_ID AS "ID MOEDA"
   
     FROM T_LANCAMENTOACCOUNT ILANCA
        INNER JOIN T_TYPEMOVIMENTO TMOV ON ILANCA.LANCACOUNT_TMOV_ID = TMOV.TMOV_ID
        INNER JOIN VER_ALL_ACCOUNT AC ON ILANCA.LANCACOUNT_ACCOUNT_ID = AC.ID
        INNER JOIN T_LANCAMENTO LANCA ON ILANCA.LANCACOUNT_LANCA_ID = LANCA.LANCA_ID
        INNER JOIN T_FUNCIONARIO FU ON ILANCA.LANCACOUNT_USER_ID = FU.FUNC_ID
        INNER JOIN T_MOEDA MD ON ILANCA.LANCACOUNT_MOE_ID = MD.MOE_ID