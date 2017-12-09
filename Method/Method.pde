int test(int x) {
    x++;
    return x;
}

{
int input = 1;

if (input == 0) {
  println(test(1));
}
else {
  println(test(2));
}
}