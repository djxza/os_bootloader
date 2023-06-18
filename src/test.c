void __asm_call(const char* f) {
    /* 
     * template: __asm("call" + f)
     * Ne bukv ovako ali treba da spojis
     * Dva string tj. "call" i string f
     */
}

void __check() {
    /* Ovde proveri da li sve radi */
    int a = 0;
    int b = 1;
    if(a != b) { return; }

    int c = 3;
    return;
}

void __entry() {
	__check();	
}
