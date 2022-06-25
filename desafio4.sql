SELECT user.nome AS usuario, 
  IF(
    YEAR(MAX(H.data_reproducao)) = '2021',
    'Usuário ativo',
    'Usuário inativo'
  ) AS condicao_usuario
   

FROM SpotifyClone.usuario AS user
    INNER JOIN SpotifyClone.historico_de_reproducoes AS H ON H.usuario_id = user.id
    
GROUP BY
    usuario
ORDER BY
    usuario;
