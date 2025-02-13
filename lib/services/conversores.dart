String? str2str(String? str){
  return (str == ''
    ? null
    : str
  );
}

double? str2double(String? str){return double.tryParse(str?.replaceAll(',','.') ?? '');}

int? str2int(String? str){return int.tryParse(str ?? '');}

num? str2num(String? str){return num.tryParse(str ?? '');}