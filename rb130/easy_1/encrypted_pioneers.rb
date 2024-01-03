def rot_char_13(char)
  if ('a'..'z').cover?(char)
    lowercase_letters = ('a'..'z').to_a
    lowercase_letters[(lowercase_letters.index(char) + 13) % 26]
  elsif ('A'..'Z').cover?(char)
    rot_char_13(char.downcase).upcase
  else
    char
  end
end

def rot_13(str)
  str.chars.map { |str| rot_char_13(str) }.join
end

names = 'Nqn Ybirynpr
Tenpr Ubccre
Nqryr Tbyqfgvar
Nyna Ghevat
Puneyrf Onoontr
Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
Wbua Ngnanfbss
Ybvf Unvog
Pynhqr Funaaba
Fgrir Wbof
Ovyy Tngrf
Gvz Orearef-Yrr
Fgrir Jbmavnx
Xbaenq Mhfr
Fve Nagbal Ubner
Zneiva Zvafxl
Lhxvuveb Zngfhzbgb
Unllvz Fybavzfxv
Tregehqr Oynapu
'
names.split('\n').each do |name|
  puts rot_13(name)
end