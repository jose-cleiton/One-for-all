SELECT COUNT(*) AS quantidade_musicas_no_historico

FROM SpotifyClone.historico_de_reproducoes H 
INNER JOIN SpotifyClone.usuario AS U
ON U.hist_id = H.usuario_id 
WHERE U.nome LIKE "Bill";

