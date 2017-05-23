//il manque la  procedure qui écrire, le groupe d'un verbe et sa conjugaison, dans le fichier conjugaison.
//il manque aussi la prise en charge des exceptions(tous groupe confondu)


program fichier_conjugaison;


uses crt,sysutils;

type
		verbe=TEXT;
		issant=TEXT;
		conjugaison=TEXT;

type
		tableau=array[1..6] of string;
		tableau_verbe=array[1..13] of string;

VAR
	pronom:tableau;
	terminaison_1:tableau;
	terminaison_2:tableau;
	terminaison_3:tableau;
	verbe_infinitif:tableau_verbe;
	verbe_issant:tableau_verbe;
	f_infinitif:verbe;
	f_issant:issant;
	f_conjugaison:conjugaison;

procedure init_infinitif;

begin
	verbe_infinitif[1]:='rire';
	verbe_infinitif[2]:='recevoir';
	verbe_infinitif[3]:='aller';
	verbe_infinitif[4]:='bouillir';
	verbe_infinitif[5]:='envoyer';
	verbe_infinitif[6]:='peindre';
	verbe_infinitif[7]:='habiter';
	verbe_infinitif[8]:='payer';
	verbe_infinitif[9]:='mourir';
	verbe_infinitif[10]:='hair';
	verbe_infinitif[11]:='vouloir';
	verbe_infinitif[12]:='finir';
	verbe_infinitif[13]:='amuser';
end;

procedure init_issant;

begin
	verbe_issant[1]:='mourir';
	verbe_issant[2]:='partir';
	verbe_issant[3]:='venir';
	verbe_issant[4]:='decouvrir';
	verbe_issant[5]:='souffrir';

end;

procedure init_trem1;

begin
	terminaison_1[1]:='e';
	terminaison_1[2]:='es';
	terminaison_1[3]:='e';
	terminaison_1[4]:='ons';
	terminaison_1[5]:='ez';
	terminaison_1[6]:='ent';

end;

procedure init_trem2;

Begin
	terminaison_2[1]:='is';
	terminaison_2[2]:='is';
	terminaison_2[3]:='it';
	terminaison_2[4]:='ions';
	terminaison_2[5]:='iez';
	terminaison_2[6]:='issent';

end;


procedure init_trem3;

Begin
	terminaison_3[1]:='e';
	terminaison_3[2]:='es';
	terminaison_3[3]:='e';
	terminaison_3[4]:='ons';
	terminaison_3[5]:='ez';
	terminaison_3[6]:='ent';

end;

procedure init_pronom;

Begin
	pronom[1]:='je';
	pronom[2]:='tu';
	pronom[3]:='il';
	pronom[4]:='nous';
	pronom[5]:='vous';
	pronom[6]:='ils';

end;

procedure fiche_infinitif;
Var 
	i:integer;
begin
	assign(f_infinitif, 'fch_infinitif');
	rewrite(f_infinitif);
	for i:=1 to 13 do 
		begin
			writeln(f_infinitif,verbe_infinitif[i]);
		end;
	close(f_infinitif);
end;

procedure fiche_issant;
Var 
	i:integer;
begin
	assign(f_issant, 'fch_issant');
	rewrite(f_issant);
	for i:=1 to 5 do 
		begin
			writeln(f_issant,verbe_issant[i]);
		end;
	close(f_issant);
end;


procedure affiche_infinitif;
var 
	i:integer;

begin
	reset(f_infinitif);
	while not Eof(f_infinitif) do
		Begin
			readln(f_infinitif,i);
			writeln(f_infinitif,i);
		end;
		close(f_infinitif);
end;

procedure affiche_issant;
var 
	i:integer;

begin
	reset(f_issant);
	while not Eof(f_issant) do
		Begin
			readln(f_issant,i);
			writeln(f_issant,i);
		end;
		close(f_infinitif);
end;

function test_grp1(mot:string) :Boolean;
var
	test:string;
	test2:Boolean;

begin
	test:=copy(mot,length(mot)-1,length(mot));
	if test = 'er' then
		test2:=true;
	if test2 or (mot<>'aller') then
		test_grp1:=true
	else
		test_grp1:=false;
end;

function test_grp2(mot:string) :Boolean;
var
	test:string;
	test2,test3:Boolean;

begin
	test:=copy(mot,length(mot)-1,length(mot));
	if test = 'ir' then
		test2:=true;
	test:=copy(mot,length(mot)-2,length(mot));
	if test<>'oir' then
		test3:=true;
	if test2 and test3 then
		test_grp2:=true
	else
		test_grp2:=false;
end;

function test_grp3(test_grp1,test_grp2:Boolean) :Boolean;


begin
	
		
	if not test_grp1 and not test_grp2 then
		test_grp1:=true
	else
		test_grp1:=false;
end;


BEGIN
	init_infinitif;
	init_issant;
	init_trem1;
	init_trem2;
	init_trem3;
	init_pronom;
	fiche_infinitif;
	fiche_issant	;
	affiche_infinitif;
	affiche_issant;
	//conjugaison;
	readln;
END.
	
