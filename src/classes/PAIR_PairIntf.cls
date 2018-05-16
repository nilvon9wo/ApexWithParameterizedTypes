public virtual interface PAIR_PairIntf<T, U> {
    T getFirst();
    U getSecond();
    void setFirst(T val);
    void setSecond(U val);
    PAIR_PairIntf<U, T> swap();
}