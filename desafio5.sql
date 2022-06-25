SELECT M.nome AS cancao,
  COUNT(H.usuario_id) AS reproducoes

FROM spotifyclone.musica AS M 
INNER JOIN spotifyclone.historico_de_reproducoes 
AS H ON M.id = H.musica_id


GROUP BY
  cancao
ORDER BY
  reproducoes DESC,
  cancao ASC
LIMIT 2;
