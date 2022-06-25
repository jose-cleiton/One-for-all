SELECT 
	MIN(P.valor) AS faturamento_minimo,
    MAX(P.valor) AS faturamento_maximo,
    ROUND(AVG(P.valor), 2) AS faturamento_medio,
    SUM(P.valor) AS faturamento_total

FROM SpotifyClone.planos AS P
INNER JOIN SpotifyClone.usuario AS USUARIO
ON P.id = USUARIO.planos_id;	
	