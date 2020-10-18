#include <iostream>
#include <vector>
#include <string>

using namespace std;

string join_vector(vector<int> &v) {
	string buf = "";
	int size = v.size();
	for (int i = 0; i < size; i++) {
		buf += to_string(v[i]);
		if (i < size - 1) {
			buf += ", ";
		}
	}
	return buf;
}

string int_to_bit_string(int bit_size, int n) {
	string buf = "";
	for (int i = bit_size - 1; i >= 0; i--) {
		if ((n >> i) & 1) {
			buf += "1";
		} else {
			buf += "0";
		}
	}
	return buf;
}

string dump_answer(vector<int> &v, int n, int bits) {
	string buf = "";
	vector<int> picked;

	for (int i = 0; i < n; i++) {
		if (bits & (1 << i)) {
			picked.push_back(v[i]);
		}
	}

	buf += "picked:";
	buf += join_vector(picked);
	buf += "\n";
	buf += "bits: ";
	buf += int_to_bit_string(n, bits);

	return buf;
}

int main(void) {
	int N, W;
	cin >> N >> W;
	vector<int> a(N);

	// cout << "a[N}" << a.t
	for (int i = 0; i < N; i++) {
		cin >> a[i];
	}

	cout << "dump inputs" << endl;
	cout << "N: " << N << endl;
	cout << "W: " << W << endl;
	cout << "array: " << join_vector(a) << endl;

	int exists = -1;
        for (int bit = 0; bit < (1 << N); bit++) {
		int sum = 0;
		for (int i = 0; i < N; i++) {
			if (bit & (1 << i)) {
				sum += a[i];
			}
		}
		if (sum == W) {
			exists = bit;
		}
        }

	if (exists != -1) {
		cout << "Yes" << endl;
		cout << dump_answer(a, N, exists) << endl;
	} else {
		cout << "No" << endl;
	}

	return 0;
}
