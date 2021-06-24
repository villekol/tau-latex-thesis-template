void sortTable( CharPair table[], int size )
{
    // Sort the table so that at each iteration the element
    // belonging to the beginning of the table is moved to
    // the appropriate position.
    for( int i = 0; i < size; ++i )
    {
        // Find the smallest (lexicographically first)
        // character from the rest of the table.
        int smallestIndex = i;
        for( int j = i; j < size; ++j )
        {
            if( table[ j ].toReplace
                < table[ smallestIndex ].toReplace )
            {
                smallestIndex = j;
            }
        }
        // Switch the smallest element to its own index.
        CharPair tmp = table[ i ];
        table[ i ] = table[ smallestIndex ];
        table[ smallestIndex ] = tmp;
    }
    return;
}