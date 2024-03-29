USE [SozlukDB]
GO
/****** Object:  StoredProcedure [dbo].[Translate]    Script Date: 8.3.2019 12:10:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Translate]
@kelime nvarchar(50),
@hangi_dilden int,
@hangi_dile int 
AS
BEGIN
DECLARE @kelime_id int

SET @kelime_id = (SELECT TOP 1 Id 
FROM Words
WHERE WordTxt = @kelime
AND Language_Id = @hangi_dilden)

SELECT WordTxt 
FROM WordWords ww
INNER JOIN Words wo
ON ww.Word_Id1 = wo.Id
WHERE Word_Id = @kelime_id
AND Language_Id = @hangi_dile

UNION ALL

SELECT WordTxt
FROM WordWords ww
INNER JOIN Words wo
ON ww.Word_Id = wo.Id
WHERE Word_Id1 = @kelime_id
AND Language_Id = @hangi_dile

END
GO
