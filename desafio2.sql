SELECT 
    COUNT(DISTINCT(M.id)) AS cancoes,
    COUNT(DISTINCT(A.id)) AS artistas,
    COUNT(DISTINCT(AL.id)) AS albums
FROM SpotifyClone.artistas AS A
  INNER JOIN SpotifyClone.album  AS AL
    ON  A.id = AL.artistas_id
  INNER JOIN SpotifyClone.musica AS M   
    ON  AL.id = M.album_id;
    