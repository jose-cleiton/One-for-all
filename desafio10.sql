SELECT T.nome AS nome,
   COUNT(H.musica_id) AS reproducoes
FROM
   SpotifyClone.musica AS  T
      INNER JOIN 
      SpotifyClone.historico_de_reproducoes AS H 
         ON H.musica_id = T.id
      INNER JOIN
      SpotifyClone.usuario AS U 
         ON U.id = H.usuario_id
      INNER JOIN
      SpotifyClone.planos AS  P 
         ON P.id = U.planos_id
      
      WHERE 
        P.nome = 'gratuito'
        OR
        P.nome = 'pessoal'
        
 GROUP BY 
      H.musica_id
      ORDER BY
      T.nome;       



