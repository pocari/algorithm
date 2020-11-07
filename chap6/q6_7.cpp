#include <cstdint>
#include <iostream>
#include <iterator>
#include <sstream>
#include <vector>
#include <algorithm>
#include <string>

using namespace std;

int64_t nn;
int64_t max_value;
vector<int64_t> as;


int count_lower(vector<int64_t>& xs, int l, int r, int64_t x) {
    int64_t c = 0;
    for (int i = l; i <= r; i++) {
        if (xs[i] < x)
            c++;
    }
    return c;
}
int64_t median(vector<int64_t>& xs, int left_bound, int right_bound) {
    int half = (right_bound - left_bound + 1) / 2;
    int64_t l = 0;
    int64_t r = max_value;

    while (l <= r) {
        int64_t m = (l + r) / 2;
        int c = count_lower(xs, left_bound, right_bound, m);

        // cout << "loop: (l, r, m, c, half): " << l << ", " << r << ", " << m << ", " << c << ", " << half << endl;
        if (c > half) {
            r = m - 1;
        } else {
            l = m + 1;
        }

    }
    return r;
}

string join(const std::vector<int64_t>& v, const char delim = ',') {
  std::string s;
  if (!v.empty()) {
    s += to_string(v[0]);
    for (decltype(v.size()) i = 1, c = v.size(); i < c; ++i) {
      s += delim;
      s += v[i];
    }
  }
  return s;
}
void dump(const vector<int64_t>& v) {
    auto i = v.begin();
    while (i != v.end()) {
        cout << *i++;
        cout << ", ";
    }
    cout << endl;
}

int main(void) {
    cin >> nn;
    as.resize(nn);
    max_value = -1;
    for (int i = 0; i < nn; i++) {
        cin >> as.at(i);
        if (max_value < as.at(i)) {
            max_value = as.at(i);
        }
    }

    vector<int64_t> bs;
    for (int i = 0; i < nn; i++) {
        for (int j = i; j < nn; j++) {
            // cout << "(i , j):" << i << j << endl;
            int64_t m = median(as, i, j);
            // cout << "m:" << m << endl;
            bs.push_back(m);
        }
    }

    // cout << "max value: " << max_value << endl;
    // dump(bs);
    cout << median(bs, 0, bs.size() - 1) << endl;

    return 0;
}

