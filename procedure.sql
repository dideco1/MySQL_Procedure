DELIMITER //
CREATE PROCEDURE insere_dados()
BEGIN
	DECLARE erro TINYINT DEFAULT FALSE;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET erro = TRUE;
START TRANSACTION;
  INSERT INTO apenas_teste (nome, descricao) VALUES ('Esse ta tudo certo', 'Esse não vai dar erro, parte pro próximo');
  INSERT INTO apenas_teste (nome, descricao) VALUES ('Esse ta tudo certo tambem', 'Parte pro próximo');
  INSERT INTO apenas_teste (nome, descricao) VALUES ('Esse nao ta tudo certo', 'Esse vai dar erro 100%', "");
  IF erro = FALSE THEN # SE não der erro ele aplica os inserts acima
    COMMIT;
    SELECT 'Transação efetivada com sucesso.' AS Resultado;
  ELSE # Caso contrário (deu erro) ele cancela tudo
    ROLLBACK;
    SELECT 'Erro na transação' AS Resultado;
  END IF;
END//
DELIMITER ;