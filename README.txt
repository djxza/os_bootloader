NEMA standard library-ja tako da ako hoces da koristic
neke od tih funkcija moras SAM da ih implementiras
i takodje oco samo koristi interrupt da bi printovalo
nesto na ekran (koristi procesor ne graficku) sto moras sam
da resis i da dodas read write na hard disk btw. compiluje
se u 32 bita jer nisam mogao da namestim vise a po defaultu
se bootuje u 16 bita (src/boot.asm:1) da bi loading bio brzi pa moras da dodas
neku entry32 funkciju da bi koristio 32 bita koristi funkciju is filea
"test.c" koja "proverava" da li os moze da se bootuje
iskreno mislim da bi ti klipi making an os to play tetris od jdha
malo pomogao sa ovime tako da da.

runaj sudo apt install make gcc i mozda tebi treba jos nes (Ako si na debian-based linuxu)
