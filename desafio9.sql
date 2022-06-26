SELECT COUNT(*) AS quantidade_musicas_no_historico
FROM spotifyclone.historico_de_reproducoes H 
INNER JOIN spotifyclone.usuario AS U
ON U.hist_id = H.usuario_id 
WHERE U.nome LIKE "Bill";

