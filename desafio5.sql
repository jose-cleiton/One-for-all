SELECT musicas.nome AS cancao,
  COUNT(H_R.usuario_id) AS reproducoes

FROM SpotifyClone.musica AS musicas
INNER JOIN SpotifyClone.historico_de_reproducoes AS H_R
ON musicas.id = H_R.musica_id
  
GROUP BY
  cancao
ORDER BY
  reproducoes DESC, 
    cancao ASC
LIMIT 2;