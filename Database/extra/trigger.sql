/* -------------------------------------------------------------------------- */
/*           Criando um trigger para auditoria da tabela CP1_EMPRESA          */
/* -------------------------------------------------------------------------- */

CREATE OR REPLACE TRIGGER TRG_AUDITORIA_EMPRESA AFTER
  INSERT OR UPDATE OR DELETE ON CP1_EMPRESA FOR EACH ROW
BEGIN
  IF INSERTING THEN
    INSERT INTO AUDITORIA_CP1_EMPRESA (
      ID,
      OPERACAO,
      DATA_OPERACAO,
      USUARIO,
      CNPJ_OLD,
      NOME_OLD,
      TIPO_OLD,
      TELEFONE_OLD,
      EMAIL_OLD,
      CNPJ_NEW,
      NOME_NEW,
      TIPO_NEW,
      TELEFONE_NEW,
      EMAIL_NEW
    ) VALUES (
      AUDITORIA_CP1_EMPRESA_SEQ.NEXTVAL, -- Sequência para gerar ID único, se necessário
      'INSERT',
      SYSDATE,
      USER,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL,
      :NEW.CNPJ,
      :NEW.NOME,
      :NEW.TIPO,
      :NEW.TELEFONE,
      :NEW.EMAIL
    );
  ELSIF UPDATING THEN
    INSERT INTO AUDITORIA_CP1_EMPRESA (
      ID,
      OPERACAO,
      DATA_OPERACAO,
      USUARIO,
      CNPJ_OLD,
      NOME_OLD,
      TIPO_OLD,
      TELEFONE_OLD,
      EMAIL_OLD,
      CNPJ_NEW,
      NOME_NEW,
      TIPO_NEW,
      TELEFONE_NEW,
      EMAIL_NEW
    ) VALUES (
      AUDITORIA_CP1_EMPRESA_SEQ.NEXTVAL, -- Sequência para gerar ID único, se necessário
      'UPDATE',
      SYSDATE,
      USER,
      :OLD.CNPJ,
      :OLD.NOME,
      :OLD.TIPO,
      :OLD.TELEFONE,
      :OLD.EMAIL,
      :NEW.CNPJ,
      :NEW.NOME,
      :NEW.TIPO,
      :NEW.TELEFONE,
      :NEW.EMAIL
    );
  ELSIF DELETING THEN
    INSERT INTO AUDITORIA_CP1_EMPRESA (
      ID,
      OPERACAO,
      DATA_OPERACAO,
      USUARIO,
      CNPJ_OLD,
      NOME_OLD,
      TIPO_OLD,
      TELEFONE_OLD,
      EMAIL_OLD,
      CNPJ_NEW,
      NOME_NEW,
      TIPO_NEW,
      TELEFONE_NEW,
      EMAIL_NEW
    ) VALUES (
      AUDITORIA_CP1_EMPRESA_SEQ.NEXTVAL, -- Sequência para gerar ID único, se necessário
      'DELETE',
      SYSDATE,
      USER,
      :OLD.CNPJ,
      :OLD.NOME,
      :OLD.TIPO,
      :OLD.TELEFONE,
      :OLD.EMAIL,
      NULL,
      NULL,
      NULL,
      NULL,
      NULL
    );
  END IF;
END;
/

/* -------------------------------------------------------------------------- */
/*                              Teste de execução                             */
/* -------------------------------------------------------------------------- */

INSERT INTO CP1_EMPRESA (
  CNPJ,
  NOME,
  TIPO,
  TELEFONE,
  EMAIL
) VALUES (
  '12345678901234',
  'Empresa 1',
  'Tipo 1',
  '1234567890',
  'empresa@email.com'
-- );

UPDATE CP1_EMPRESA
SET
  NOME = 'Empresa 1 Atualizada'
WHERE
  CNPJ = '12345678901234';

DELETE FROM CP1_EMPRESA
WHERE
  CNPJ = 12345678901234;