SELECT 
	A.nome AS artista,
    ALB.nome AS album

FROM 
	SpotifyClone.artistas AS A
    INNER JOIN SpotifyClone.album AS ALB
    ON ALB.artistas_id = A.id 
WHERE
	A.nome = 'Walter Phoenix'
GROUP BY
	artista,
    album
