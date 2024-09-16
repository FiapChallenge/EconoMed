SET SERVEROUTPUT ON

CREATE OR REPLACE FUNCTION VALIDAR_CPF (
    CPF IN VARCHAR2
) RETURN BOOLEAN IS
BEGIN
 
    -- Verifica se o CPF possui 11 dígitos
    IF LENGTH(CPF) != 11 THEN
        RETURN FALSE;
    END IF;
 

    -- Verifica se todos os caracteres do CPF são dígitos
    FOR I IN 1..LENGTH(CPF) LOOP
        IF NOT REGEXP_LIKE(SUBSTR(CPF, I, 1), '[[:digit:]]') THEN
            RETURN FALSE;
        END IF;
    END LOOP;
 

    -- Verifica se o CPF é válido
    DECLARE
        TOTAL   NUMBER;
        DIGITO1 NUMBER;
        DIGITO2 NUMBER;
        SOMA    NUMBER := 0;
        RESTO   NUMBER;
        PESO    NUMBER := 10;
    BEGIN
 
        -- Calcula o primeiro dígito verificador
        FOR I IN 1..9 LOOP
            SOMA := SOMA + TO_NUMBER(SUBSTR(CPF, I, 1)) * PESO;
            PESO := PESO - 1;
        END LOOP;

        RESTO := MOD(SOMA, 11);
        IF RESTO < 2 THEN
            DIGITO1 := 0;
        ELSE
            DIGITO1 := 11 - RESTO;
        END IF;
 

        -- Calcula o segundo dígito verificador
        SOMA := 0;
        PESO := 11;
        FOR I IN 1..9 LOOP
            SOMA := SOMA + TO_NUMBER(SUBSTR(CPF, I, 1)) * PESO;
            PESO := PESO - 1;
        END LOOP;

        SOMA := SOMA + DIGITO1 * 2;
        RESTO := MOD(SOMA, 11);
        IF RESTO < 2 THEN
            DIGITO2 := 0;
        ELSE
            DIGITO2 := 11 - RESTO;
        END IF;
 

        -- Verifica se os dígitos verificadores estão corretos
        IF DIGITO1 = TO_NUMBER(SUBSTR(CPF, 10, 1)) AND DIGITO2 = TO_NUMBER(SUBSTR(CPF, 11, 1)) THEN
            RETURN TRUE;
        ELSE
            RETURN FALSE;
        END IF;
    END;
END VALIDAR_CPF;
/

-- Função para validar e-mail
CREATE OR REPLACE FUNCTION VALIDAR_EMAIL (
    EMAIL IN VARCHAR2
) RETURN BOOLEAN IS
BEGIN
 
    -- Utilizando uma expressão regular para validar o formato do e-mail
    IF REGEXP_LIKE(EMAIL, '[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}') THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END VALIDAR_EMAIL;
/

-- Exemplo verdadeiro de CPF
DECLARE
    V_CPF_VALIDO VARCHAR2(14) := '16595164710';
BEGIN
    IF VALIDAR_CPF(V_CPF_VALIDO) THEN
        DBMS_OUTPUT.PUT_LINE('CPF válido: '
                             || V_CPF_VALIDO);
    ELSE
        DBMS_OUTPUT.PUT_LINE('CPF inválido: '
                             || V_CPF_VALIDO);
    END IF;
END;
/

-- Exemplo falso de CPF
DECLARE
    V_CPF_INVALIDO VARCHAR2(14) := '12345678900';
BEGIN
    IF VALIDAR_CPF(V_CPF_INVALIDO) THEN
        DBMS_OUTPUT.PUT_LINE('CPF válido: '
                             || V_CPF_INVALIDO);
    ELSE
        DBMS_OUTPUT.PUT_LINE('CPF inválido: '
                             || V_CPF_INVALIDO);
    END IF;
END;
/

-- Exemplo verdadeiro de e-mail
DECLARE
    V_EMAIL_VALIDO VARCHAR2(100) := 'usuario@dominio.com';
BEGIN
    IF VALIDAR_EMAIL(V_EMAIL_VALIDO) THEN
        DBMS_OUTPUT.PUT_LINE('E-mail válido: '
                             || V_EMAIL_VALIDO);
    ELSE
        DBMS_OUTPUT.PUT_LINE('E-mail inválido: '
                             || V_EMAIL_VALIDO);
    END IF;
END;
/

-- Exemplo falso de e-mail
DECLARE
    V_EMAIL_INVALIDO VARCHAR2(100) := 'usuario@dominio';
BEGIN
    IF VALIDAR_EMAIL(V_EMAIL_INVALIDO) THEN
        DBMS_OUTPUT.PUT_LINE('E-mail válido: '
                             || V_EMAIL_INVALIDO);
    ELSE
        DBMS_OUTPUT.PUT_LINE('E-mail inválido: '
                             || V_EMAIL_INVALIDO);
    END IF;
END;
/

CREATE OR REPLACE FUNCTION CLIENTE_TO_JSON(
    CLIENTE_ID IN NUMBER
) RETURN CLOB IS
    V_JSON  CLOB := '{';
    V_COMMA VARCHAR2(10) := '';
BEGIN
    FOR REC IN (
        SELECT
            *
        FROM
            CP1_CLIENTE
        WHERE
            ID = CLIENTE_ID
    ) LOOP
        V_JSON := V_JSON
                  || V_COMMA
                  || '"ID": "'
                  || REC.ID
                  || '",';
        V_JSON := V_JSON
                  || '"RG": "'
                  || REC.RG
                  || '",';
        V_JSON := V_JSON
                  || '"NOME": "'
                  || REC.NOME
                  || '",';
        V_JSON := V_JSON
                  || '"SEXO": "'
                  || REC.SEXO
                  || '",';
        V_JSON := V_JSON
                  || '"TELEFONE": "'
                  || REC.TELEFONE
                  || '",';
        V_JSON := V_JSON
                  || '"EMAIL": "'
                  || REC.EMAIL
                  || '",';
        V_JSON := V_JSON
                  || '"DATA_NASCIMENTO": "'
                  || TO_CHAR(REC.DATA_NASCIMENTO, 'YYYY-MM-DD')
                     || '",';
        V_JSON := V_JSON
                  || '"CPF": "'
                  || REC.CPF
                  || '",';
        V_JSON := V_JSON
                  || '"CONVENIO_ID": "'
                  || REC.CONVENIO_ID
                  || '",';
        V_JSON := V_JSON
                  || '"ESTADO_CIVIL_ID": "'
                  || REC.ESTADO_CIVIL_ID
                  || '"';
        V_COMMA := '';
    END LOOP;

    V_JSON := V_JSON
              || '}';
    RETURN V_JSON;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN '{"error": "No data found"}';
    WHEN VALUE_ERROR THEN
        RETURN '{"error": "Invalid value"}';
    WHEN OTHERS THEN
        RETURN '{"error": "An unexpected error occurred"}';
END;
/

DECLARE
    V_JSON CLOB;
BEGIN
    V_JSON := CLIENTE_TO_JSON(1);
    DBMS_OUTPUT.PUT_LINE(V_JSON);
END;
/

CREATE OR REPLACE FUNCTION CHECK_PASSWORD_COMPLEXITY(
    P_PASSWORD IN VARCHAR2
) RETURN VARCHAR2 IS
    V_MESSAGE VARCHAR2(200);
BEGIN
 
    -- Verifica o comprimento da senha
    IF LENGTH(P_PASSWORD) < 8 THEN
        V_MESSAGE := 'A senha é muito curta. Deve ter pelo menos 8 caracteres.';
 
        -- Verifica se há pelo menos uma letra maiúscula
    ELSIF NOT REGEXP_LIKE(P_PASSWORD, '[A-Z]') THEN
        V_MESSAGE := 'A senha deve conter pelo menos uma letra maiúscula.';
 
        -- Verifica se há pelo menos uma letra minúscula
    ELSIF NOT REGEXP_LIKE(P_PASSWORD, '[a-z]') THEN
        V_MESSAGE := 'A senha deve conter pelo menos uma letra minúscula.';
 
        -- Verifica se há pelo menos um número
    ELSIF NOT REGEXP_LIKE(P_PASSWORD, '[0-9]') THEN
        V_MESSAGE := 'A senha deve conter pelo menos um número.';
 
        -- Se todas as condições forem atendidas
    ELSE
        V_MESSAGE := 'A SENHA É VÁLIDA.';
    END IF;

    RETURN V_MESSAGE;
EXCEPTION
 
    -- Exceção para erro de valor
    WHEN VALUE_ERROR THEN
        RETURN 'ERRO: FORMATO DE SENHA INVÁLIDO.';
 
        -- Exceção para erro de dados nulos ou inválidos
    WHEN NO_DATA_FOUND THEN
        RETURN 'ERRO: DADOS NÃO ENCONTRADOS.';
 
        -- Exceção para outros erros não esperados
    WHEN OTHERS THEN
        RETURN 'ERRO: OCORREU UM ERRO INESPERADO.';
END;
/

DECLARE
    V_MESSAGE VARCHAR2(200);
BEGIN
 
    -- Teste senha válida
    V_MESSAGE := CHECK_PASSWORD_COMPLEXITY('SenhaValida1!');
    DBMS_OUTPUT.PUT_LINE('Teste 1: '
                         || V_MESSAGE);
 
    -- Teste senha muito curta
    V_MESSAGE := CHECK_PASSWORD_COMPLEXITY('Curta1!');
    DBMS_OUTPUT.PUT_LINE('Teste 2: '
                         || V_MESSAGE);
 
    -- Teste senha sem letra maiúscula
    V_MESSAGE := CHECK_PASSWORD_COMPLEXITY('senhaexemplo1!');
    DBMS_OUTPUT.PUT_LINE('Teste 3: '
                         || V_MESSAGE);
 
    -- Teste senha sem letra minúscula
    V_MESSAGE := CHECK_PASSWORD_COMPLEXITY('SENHAEXEMPLO1!');
    DBMS_OUTPUT.PUT_LINE('Teste 4: '
                         || V_MESSAGE);
 
    -- Teste senha sem número
    V_MESSAGE := CHECK_PASSWORD_COMPLEXITY('SenhaSemNumero!');
    DBMS_OUTPUT.PUT_LINE('Teste 5: '
                         || V_MESSAGE);

END;
/