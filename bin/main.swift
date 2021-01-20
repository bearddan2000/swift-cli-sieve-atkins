//swift 5.1.5

// method generate all prime number less then N in O(n)
func atkins(_ limit:Int) -> String {

  var output = "[OUTPUT] "

  // 2 and 3 are known to be prime
  if limit > 2 {
    output += "2, ";
  }

  if limit > 3 {
    output += "3, ";
  }

  // Initialise the sieve array with false values
  var sieve = Array<Int>(repeating:0, count:limit+1);

  var x = 1;
  while x * x < limit {

    var y = 1;
    while y * y < limit {

      // Main part of Sieve of Atkin
      var n = (4 * x * x) + (y * y);
      if n <= limit && (n % 12 == 1 || n % 12 == 5) {
        sieve[n] = (sieve[n] ^ 1);
      }

      n = (3 * x * x) + (y * y);
      if n <= limit && n % 12 == 7 {
        sieve[n] = (sieve[n] ^ 1);
      }

      n = (3 * x * x) - (y * y);
      if x > y && n <= limit && n % 12 == 11 {
        sieve[n] = (sieve[n] ^ 1);
      }

      y+=1
    }
    x+=1
  }
  // Mark all multiples of squares as non-prime
  var r = 5;
  while r * r < limit {
    if sieve[r] == 1 {
      var i = r * r
      while i < limit {
        sieve[i] = 0;
        i += r * r
      }
    }
    r+=1
  }

  // Print primes using sieve[]
  for a in 5...limit {
    if sieve[a] == 1 {
      output += "\(a), ";
    }
  }
  return output;
}

func main() {
  let N = 10
  let output = atkins(N);

  print("[INPUT] \(N)");
  print(output);
}

main()
