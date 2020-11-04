#include <cstdint>
#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

int64_t nn, kk;
vector<int64_t> as;
vector<int64_t> bs;

bool check_k(int64_t x) {
    int64_t cnt = 0;
    for (int i = 0; i < nn; i++) {
        cnt += upper_bound(bs.begin(), bs.end(), x / as.at(i)) - bs.begin();
    }
    return cnt >= kk;
}

int main(void) {
    cin >> nn >> kk;
    as.resize(nn);
    bs.resize(nn);

    for (int i = 0; i < nn; i++) {
        cin >> as.at(i);
    }
    for (int i = 0; i < nn; i++) {
        cin >> bs.at(i);
    }
    sort(bs.begin(), bs.end());

    int64_t l = 0, r = 1e+18;
    while (r - l > 1) {
        int64_t x = (l + r) / 2;
        if (check_k(x)) {
            r = x;
        } else {
            l = x;
        }
    }

    cout << r << endl;
}
