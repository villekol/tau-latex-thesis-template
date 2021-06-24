void jarjesta( Kirjainpari taulukko[], int koko )
{
    // Järjestetään taulukko siten, että jokaisella kierroksella
    // valitaan alkio, joka kuuluu taulukon ensimmäiseksi
    // ja siirretään se oikealle paikalleen.
    for( int i = 0; i < koko; ++i )
    {
        // Etsitään pienin eli lähinnä aakkosten alkua oleva
        // kirjan lopputaulukosta
        int pienimmanKohta = i;
        for( int j = i; j < koko; ++j )
        {
            if( taulukko[ j ].korvattava
                < taulukko[ pienimmanKohta ].korvattava )
            {
                pienimmanKohta = j;
            }
        }
        // Vaihdetaan pienin alkio omalle paikalleen
        Kirjainpari tmp = taulukko[ i ];
        taulukko[ i ] = taulukko[ pienimmanKohta ];
        taulukko[ pienimmanKohta ] = tmp;
    }
    return;
}