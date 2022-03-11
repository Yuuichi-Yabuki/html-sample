private class ArrayList<T> {
    private T path;
    
    private void execute(T path) {
        this.path = path;    
    }
    
    private T getLogger() {
        return this.path;    
    }
}