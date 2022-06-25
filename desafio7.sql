SELECT 
    A.nome AS artista,
	  ALB.nome AS album,
    COUNT(F.usuario_id) AS seguidores
    
FROM 
	SpotifyClone.artistas AS A 
	INNER JOIN SpotifyClone.album AS ALB
	ON A.id = ALB.artistas_id 
	INNER JOIN SpotifyClone.usuario_tem_artistas AS F
	ON A.id = F.artistas_id
    
GROUP BY
	A.nome,
    ALB.nome
ORDER BY
	seguidores DESC,
    artista ASC,
    album ASC;