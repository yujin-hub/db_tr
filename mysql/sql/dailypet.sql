use dailypet;


select * from member; 
select * from animal;
select * from diary;
select * from code;
select * from codegroup;
select * from foundpet;
select * from likebtn;
select * from comment;
select * from petUploaded;
select * from reservation;
select * from diaryUploaded;

SELECT
	a.ifdaSeq
    , a.ifdaContents
    , a.ifdaRegDate
	, a.mm_ifmmSeq 
    , b.ifmmID
    , c.path
	, c.uuidName
FROM diary a
JOIN member b ON a.mm_ifmmSeq = b.ifmmSeq
JOIN diaryUploaded c ON c.pseq = a.mm_ifmmSeq
WHERE 1=1
ORDER BY a.ifdaSeq DESC
GROUP BY c.ifdaContents
;




SELECT
			a.ifdaSeq
			,a.ifdaContents
			,a.ifdaDelNy
			,a.ifdaRegDate
			,a.mm_ifmmSeq
			,b.ifmmID
			,c.path
			,c.uuidName
		FROM diary a
		JOIN member b 
		ON a.mm_ifmmSeq = b.ifmmSeq
		JOIN diaryUploaded c 
		ON a.mm_ifmmSeq = c.pseq
		WHERE 1=1
		ORDER BY a.ifdaSeq DESC
        ;
        