
DROP DATABASE IF EXISTS `SpotifyClone`;
CREATE SCHEMA IF NOT EXISTS `SpotifyClone`;
USE `SpotifyClone` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`planos`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(60) NOT NULL,
    `valor` DECIMAL(4, 2) NOT NULL,
    PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`artistas`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(200) NOT NULL,
    PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`album`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(50) NOT NULL,
    `data_de_lancamento` INT NOT NULL,
    `artistas_id` INT NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`artistas_id`) REFERENCES `SpotifyClone`.`artistas` (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`musica`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(60) NOT NULL,
    `album_id` INT NOT NULL,
    `duracao` INT NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`album_id`) REFERENCES `SpotifyClone`.`album` (`id`)
)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `SpotifyClone`.`usuario`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(60) NOT NULL,
    `idade` INT NOT NULL,
    `data_assinatura` DATE NOT NULL,
    `planos_id` INT NOT NULL,
    `hist_id` INT NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`planos_id`)
    REFERENCES `SpotifyClone`.`planos` (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`usuario_tem_artistas`(
    `artistas_id` INT NOT NULL,
    `usuario_id` INT NOT NULL,
    PRIMARY KEY (`artistas_id`, `usuario_id`),
    FOREIGN KEY (`artistas_id`)
    REFERENCES `SpotifyClone`.`artistas` (`id`),
    FOREIGN KEY (`usuario_id`)
    REFERENCES `SpotifyClone`.`usuario` (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`historico_de_reproducoes`(
    `data_reproducao` DATETIME NOT NULL,
    `usuario_id` INT NOT NULL,
    `musica_id` INT NOT NULL,
    PRIMARY KEY (`usuario_id`, `musica_id`),
    FOREIGN KEY (`usuario_id`)
    REFERENCES `SpotifyClone`.`usuario` (`id`),
    FOREIGN KEY (`musica_id`)
    REFERENCES `SpotifyClone`.`musica` (`id`))
ENGINE = InnoDB;


/* preenchendo tabela  planos */
INSERT INTO `SpotifyClone`.`planos` (`nome`, `valor`)
VALUES
	('gratuito', 0.00),
    ('pessoal', 6.99),
    ('familiar', 7.99),
    ('universitário', 5.99);

/* preenchendo tabela nome  */

INSERT INTO `SpotifyClone`.`artistas` (`nome`)
VALUES
	('Walter Phoenix'),
    ('Peter Strong'),
    ('Lance Day'),
    ('Freedie Shannon'),
    ('Tyler Isle'),
    ('Fog');

/* preenchendo tabela album  */

INSERT INTO `SpotifyClone`.`album` (`artistas_id`, `nome`, `data_de_lancamento`)
VALUES
	(1, 'Envious', 1990),
    (1, 'Exuberant', 1993),
    (2, 'Hallowed Steam', 1995),
    (3, 'Incandescent', 1998),
    (4, 'Temporary Culture', 2001),
    (4, 'Library of liberty', 2003),
    (5, 'Chained Down', 2007),
    (5, 'Cabinet of fools', 2012),
    (5, 'No guarantees', 2015),
    (6, 'Apparatus', 2015);

/* preenchendo tabela musica  */

INSERT INTO `SpotifyClone`.`musica` (`album_id`, `nome`, `duracao`)
VALUES
	(1, "Soul For Us", 200),
  (1, "Reflections Of Magic", 163),
  (1, "Dance With Her Own", 116),
  (2, "Troubles Of My Inner Fire", 203),
  (2, "Time Fireworks", 152),
  (3, "Magic Circus", 105),
  (3, "Honey, So Do I", 207),
  (3, "Sweetie, Let's Go Wild", 139),
  (3, "She Knows", 244),
  (4, "Fantasy For Me", 100),
  (4, "Celebration Of More", 146),
  (4, "Rock His Everything", 223),
  (4, "Home Forever", 231),
  (4, "Diamond Power", 241),
  (4, "Let's Be Silly", 132),
  (5, 'Thang Of Thunder', 240),
	(5, 'Words Of Her Life', 185),
	(5, 'Without My Streets', 176),
	(6, 'Need Of The Evening', 190),
	(6, 'History Of My Roses', 222),
	(6, 'Without My Love', 111),
	(6, 'Walking And Game', 123),
	(6, 'Young And Father', 197),
	(7, 'Finding My Traditions', 179),
	(7, 'Walking And Man', 229),
	(7, 'Hard And Time', 135),
	(7, "Honey, I'm A Lone Wolf", 150),
	(8, "She Thinks I Won't Stay Tonight", 166),
	(8, "He Heard You're Bad For Me", 154),
	(8, "He Hopes We Can't Stay", 210),
	(8, 'I Know I Know', 117),
	(9, "He's Walking Away", 159),
	(9, "He's Trouble", 138),
	(9, 'I Heard I Want To Bo Alone', 120),
	(9, 'I Ride Alone', 151),
	(10, 'Honey', 79),
	(10, 'You Cheated On Me', 95),
	(10, "Wouldn't It Be Nice", 213),
	(10, 'Baby', 136),
	(10, 'You Make Me Feel So..', 83);

/* preenchendo tabela usuario  */

INSERT INTO `SpotifyClone`.`usuario` (`nome`, `idade`, `hist_id`, `planos_id`, `data_assinatura`)
VALUES
	('Thati', 23, 1, 1, '2019-10-20'),
  ('Cintia', 35, 2, 3, '2017-12-30'),
  ('Bill', 20, 3, 4, '2019-06-05'),
  ('Roger', 45, 4, 2, '2020-05-13'),
  ('Norman', 58, 5, 2, '2017-02-17'),
  ('Patrick', 33, 6, 3, '2017-01-06'),
  ('Vivian', 26, 7 , 4, '2018-01-05'),
  ('Carol', 19, 8, 4, '2018-02-14'),
  ('Angelina', 42, 9, 3, '2018-04-29'),
  ('Paul', 46, 10, 3, '2017-01-17');

/* preenchendo tabela usuario_tem_artistas  */

INSERT INTO `SpotifyClone`.`usuario_tem_artistas` (`usuario_id`, `artistas_id`)
VALUES
	(1, 1),
  (1, 3),
  (1, 4),
  (2, 1),
  (2, 3),
  (3, 1),
  (3, 2),
  (4, 4),
  (5, 5),
  (5, 6),
  (6, 1),
  (6, 3),
  (6, 6),
  (7, 2),
  (7, 5),
  (8, 1),
  (8, 5),
  (9, 3),
  (9, 4),
  (9, 6),
  (10, 2),
  (10,6);


/* preenchendo tabela historico_de_reproduções  */

INSERT INTO `SpotifyClone`.`historico_de_reproducoes` (`data_reproducao`, `usuario_id`, `musica_id`)
VALUES
	('2020-02-28 10:45:55', 1, 36),
  ('2020-05-02 05:30:35', 1, 25),
  ('2020-03-06 11:22:33', 1, 23),
  ('2020-08-05 08:05:17', 1, 14),
  ('2020-09-14 16:32:22', 1, 15),
  ('2020-01-02 07:40:33', 2, 34),
  ('2020-05-16 06:16:22', 2, 24),
  ('2020-10-09 12:27:48', 2, 21),
  ('2020-09-21 13:14:46', 2, 39),
  ('2020-11-13 16:55:13', 3, 6),
  ('2020-12-05 18:38:30', 3, 3),
  ('2020-07-30 10:00:00', 3, 26),
  ('2021-08-15 17:10:10', 4, 2),
  ('2021-07-10 15:20:30', 4, 35),
  ('2021-01-09 01:44:33', 4, 27),
  ('2020-07-03 19:33:28', 5, 7),
  ('2017-02-24 21:14:22', 5, 12),
  ('2020-08-06 15:23:43', 5, 14),
  ('2020-11-10 13:52:27', 5, 1),
  ('2019-02-07 20:33:48', 6, 38),
  ('2017-01-24 00:31:17', 6, 29),
  ('2017-10-12 12:35:20', 6, 30),
  ('2018-05-29 14:56:41', 6, 22),
  ('2018-05-09 22:30:49', 7, 5),
  ('2020-07-27 12:52:58', 7, 4),
  ('2018-01-16 18:40:43', 7, 11),
  ('2018-03-21 16:56:40', 8, 39),
  ('2020-10-18 13:38:05', 8, 40),
  ('2019-05-25 08:14:03', 8, 32),
  ('2021-08-15 21:37:09', 8, 33),
  ('2021-05-24 17:23:45', 9, 16),
  ('2018-12-07 22:48:52', 9, 17),
  ('2021-03-14 06:14:26', 9, 8),
  ('2020-04-01 03:36:00', 9, 9),
  ('2017-02-06 08:21:34', 10, 20),
  ('2017-12-04 05:33:43', 10, 21),
  ('2017-07-27 05:24:49', 10, 12),
  ('2017-12-25 01:03:57', 10, 13);