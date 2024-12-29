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

# Demo
string = "BANANA"
bwt_result = BwtNaive.burrows_wheeler_transform(string)
print(f"Burrows-Wheeler Transform of '{string}': {bwt_result}")
