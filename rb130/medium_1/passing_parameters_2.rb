def my_method(arr)
  yield(arr)
end

my_method(%w(raven finch hawk eagle)) { |blah, bluh, *raptors| p raptors }