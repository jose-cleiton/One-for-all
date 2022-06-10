SELECT usuario.nome AS usuario, 
    COUNT(H.musica_id) AS qtde_musicas_ouvidas,
    ROUND(SUM(M.duracao/60),2) AS total_minutos 

FROM SpotifyClone.usuario AS usuario
    INNER JOIN SpotifyClone.historico_de_reproducoes AS H ON usuario.id = H.usuario_id 
    INNER JOIN SpotifyClone.musica AS M ON H.musica_id = M.id
GROUP BY 
    usuario
ORDER BY 
  usuario