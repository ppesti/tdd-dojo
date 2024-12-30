class BwtNaive:
    NULL_TERM = '$'

    @staticmethod
    def get_str_with_null_terminator(string):
        return string + BwtNaive.NULL_TERM

    @staticmethod
    def transform(string):
        if not string:
            return ''
        return string[-1] + string[:-1]

    @staticmethod
    def get_bwt_arr(string):
        transform_arr = [string]
        input_str = string

        for _ in range(1, len(string)):
            transformed = BwtNaive.transform(input_str)
            transform_arr.append(transformed)
            input_str = transformed

        return transform_arr

    @staticmethod
    def burrows_wheeler_transform(string):
        if not string:
            return ''

        transform_arr = BwtNaive.get_bwt_arr(BwtNaive.get_str_with_null_terminator(string))
        transform_arr.sort()
        res = ''.join(s[-1] for s in transform_arr)

        return res


# Optimized implementation
class Bwt:
    NULL_TERM = '$'

    @staticmethod
    def get_str_with_null_terminator(s):
        return s + Bwt.NULL_TERM

    @staticmethod
    def get_unsorted_suffix_arr(s):
        suffixes = []

        for i in range(len(s)):
            suffixes.append((i, s[i:]))
        
        return suffixes

    @staticmethod
    def get_suffix_arr(s):
        suffixes = Bwt.get_unsorted_suffix_arr(s)
        return sorted(suffixes, key=lambda x: x[1])

    @staticmethod
    def burrows_wheeler_transform(s):
        null_terminated_str = Bwt.get_str_with_null_terminator(s)
        bws = Bwt.get_suffix_arr(null_terminated_str)

        res = []
        for i, _ in bws:
            res.append(null_terminated_str[-1] if i == 0 else null_terminated_str[i - 1])

        return ''.join(res)


# Demo
inputs = ["BANANA", "islanders", "123"]
for input in inputs:
    print(f"Burrows-Wheeler Transform of '{input}'")

    bwt_naive = BwtNaive.burrows_wheeler_transform(input)
    print(f"  - via the naive algorithm: '{bwt_naive}'")

    bwt_optimized = Bwt.burrows_wheeler_transform(input)
    print(f"  - via the optimized algorithm: '{bwt_optimized}'\n")
