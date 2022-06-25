SELECT 
  COUNT(H.musica_id) AS quantidade_musicas_no_historico

FROM spotifyclone.usuario AS U

INNER JOIN spotifyclone.historico_de_reproducoes H 
ON U.hist_id = H.usuario_id 
WHERE U.nome LIKE "Bill";