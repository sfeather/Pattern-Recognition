			      Pană Ştefan, 312CC

===============================================================================

Task1 - Sparse Jacobi

Funcţia generate_probabilities_system:
-am urmat indicaţiile din temă şi am format sistemul de ecuaţii reprezentat de
matricea A şi de vectorul b;
-pentru început am găsit numărul total de noduri al "labirintului" în funcţîie
de câte linii am;
-apoi, am format vectorul b astfel încât să meargă pentru fiecare caz;
-în variabila vectNoduri am păstrat numărul de "drumuri" care pleacă din
fiecare nod pentru a forma diagonala matricei A, iar pentru fiecare 2 "vecini"
(2 noduri cu drum comun) am pus in matricea A (pe linia nod1, coloana nod2 şi
pe linia nod2, coloana nod1) valoarea -1.

Funcţia matrix_to_csr
-am urmat indicaţiile din temă şi din pagina de wikipedia oferită de voi şi am
realizat transformarea unei matrice în una de forma CSR.

Funcţia Jacobi_factorization
-am urmat cursul şi laboratorul în care am vorbit despre factorizarea Jacobi
şi am returnat matricea de iteraţie Gj si vectorul de iteratie cj.

Funcţia Jacobi_sparse
-pentru început am folosit funcţia oferită de voi csr_multiplication şi am
format vectorul soluţie x = y + c, unde c = cj de mai sus. Am efectuat apoi
acelaşi procedeu (memorând aproximarea anterioară a soluţiei, x0) până când
norma euclidiană a lui x - x0 (vectorul soluţie - vectorul soluţie anterior)
este mai mică decât tol.

===============================================================================

Task2 - K-Means

Funcţia clustering_pc
-am creat NC clustere ca în indicaţiile oferite de voi, iar apoi NC centroizi;
-am iniţializat NC liste goale de puncte şi le-am atribuit fiecăreia câte un
centroid. Am calculat distanţa euclidiană dintre fiecare punct din points şi
fiecare centroid şi astfel am distribuit fiecare punct grupului reprezentat de
cel mai apropiat centroid. Recalculez poziţiile centroizilor (pentru noile
puncte). Procedez astfel până când norma euclidiană a list-centroids
(list este matricea cu vechii centroizi) este mai mică decât 0.00001.

Funcţia compute_cost_pc
-calculez distanţa euclidiană de la fiecare punct la centroidul clusterului
căruia îi aparţine şi adaug în variabila cost distanţa minimă.

===============================================================================

Task3 - Householder prediction

Funcţia rgbHistogram
-mă folosesc de funcţiile imread() şi histc() pentru a crea, pe rând, vectorii
linie de lungime count_bins care reprezintă histogramele r, g si b ale
imaginii;
-la final unesc aceşti 3 vectori în unul nou cu numele de sol.

Funcţia hsvHistogram
-transform o imagine din RGB în HSV iar după aceea procedez la fel ca mai sus;
-pentru a transforma o imagine din RGB în HSV am făcut o funcţie numită
rgb_2_hsv2, urmând indicaţiile voastre;
-la început, această funcţie nu era vectorizată şi timpul necesar procesării
imaginilor era foarte mare; ulterior, am vectorizat-o utilizând funcţia find()
şi timpul de procesare s-a redus semnificativ, însă tot nu era de ajuns. Am
căutat pe internet alte procedee de vectorizare şi am descoperit că în matlab
pot să stochez condiţii în variabile, aşa că m-am folosit de acest lucru şi am
reuşit să scad timpul de rulare a taskului 3 la sub 20 de secunde.

Funcţia Householder
-pentru această funcţie am urmărit indicaţiile şi paşii de rezolvare din
laborator şi pentru uşurinţă am comentat codul cu fiecare pas.

Funcţia SST
-şi aici am urmat indicaţiile din laborator pentru rezolvarea unui sistem
superior triunghiular.

Funcţia preprocess
-am luat fiecare poză din path_to_dataset (din folderele cu pisici şi cel fără
pisici) şi le-am descompus fie în histograme RGB, fie în histograme HSV;
-vectorii soluţie i-am pus în matricea X (pe linii) şi în acelaşi timp am
completat vectorul y cu 1 dacă poza era cu pisică şi cu -1 dacă poza nu era
cu pisică.

Funcţia learn
-m-am folosit de funcţiile Householder şi SST prezentate mai devreme astfel:
am folosit Householder pentru a transforma matricea X1 (formată din matricea X
de la functia preprocess la care am adaugat o coloană de 1) în 2 matrici Q şi R
şi apoi am rezolvat sistemul A*w = b, unde b = Q' * y' şi A = R.

Funcţia evaluate
-funcţia seamănă foarte mult cu preprocess, doar că dupa ce aflam histogramele
RGB/HSV evaluăm în vectorul y dacă aceasta este cu pisică sau nu;
-procentajul de reuşită se calculează astfel: numărul de poze evaluate corect
supra numărul total de poze.

===============================================================================

Task4 - Gradient Descent prediction

Funcţia learn
-am scalat matricea X şi i-am dat vectorului w valori random intre -0.1 si 0.1;
-am aplicat algoritmul Mini-batch Gradient Descent prezentat în enunţul temei;

Funcţia evaluate
-este aceeaşi funcţie de la Task3 doar că soluţiile sunt stocate în matricea X
care este ulterior scalată;
-după ce se scalează matricea X, se ia fiecare linie şi se înmulţeşte cu
vectorul w, rezultatul păstrându-se în vectorul y;

Am folosit funcţii de la Task-ul 3 precum: hsvHistogram, preprocess,
rgb_2_hsv2 şi rgbHistogram.

===============================================================================

Timp total de lucru: 30 de ore.