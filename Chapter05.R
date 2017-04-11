# �wR�ɂ��f�[�^�������W�x
#�@�� 5 �́@HTTP

library(RCurl)

library(stringr)

## �͂Ȃ����߂Ȃ������ԍ��̂���ӏ��V���[�v�Q��
### �ԍ��̂Ȃ����o�������̓V���[�v�R��

## 5.1.2 URL �\��
### URL �G���R�[�f�B���O

t <- "I�fm Eddie! How are you &you? 1 + 1 = 2"

(url <- URLencode(t))

(url <- URLencode(t, reserve =TRUE))


## 5.2.1.1 �N���C�A���g���ʂ̂��߂� HTTP �w�b�_�t�B�[���h

R.version$version.string

R.version$platform

cat(getURL("http://httpbin.org/headers", useragent =
             str_c(R.version$platform,
                   R.version$version.string, sep=", ")))

### Referer

getURL("http://httpbin.org/headers", 
       httpheader = c(From = "eddie@r-collection.com"))

### From

getURL("http://httpbin.org/headers", 
       httpheader = c(From = "eddie@r-collection.com"))

url <- "www.r-datacollection.com/materials/http/helloworld.html"


## 5.2.1.2 Cookie
### Cookie �̎��

cat(getURL("http://httpbin.org/headers", 
cookie = "id=12345;domain=httpbin.org"))


## �@5.2.2 �F��
### �x�[�V�b�N�F��
(secret <- base64("This is a secret message"))

base64Decode(secret)


## 5.2.3 �v���L�V
### �v���L�V�̃^�C�v
### �ˋ�̃v���L�V���w�肵����
# getURL("http://httpbin.org/headers",
#        proxy = "109.205.54.112:8080",
#        followlocation = TRUE)

## 5.3 HTTP �ȊO�̃v���g�R��

curlVersion()$protocols


## 5.4 HTTP �v���g�R���̎���
### 5.4.1 libcurl ���C�u����

names(getCurlOptionsConstants())


## 5.4.2 ��{�I�ȃ��N�G�X�g���\�b�h
### 5.4.2.1 GET ���\�b�h

getURL("http://www.r-datacollection.com/materials/http/helloworld.html")

pngfile <- getBinaryURL("http://www.r-datacollection.com/materials/http/sky.png")

writeBin(pngfile, "sky.png")

### GET �t�H�[��

url <- "http://www.r-datacollection.com/materials/http/GETexample.php"

namepar <- "Eddie"

agepar <- "32"

url_get <- str_c(url, "?", "name=", namepar, "&", "age=", agepar)

cat(getURL(url_get))

url <- "http://www.r-datacollection.com/materials/http/GETexample.php"

cat(getForm(url, name = "Eddie", age = 32))

## 5.4.2.2 POST ���\�b�h
### POST �t�H�[��

url <- "http://www.r-datacollection.com/materials/http/POSTexample.php"

cat(postForm(url, name = "Eddie", age = 32,
             style="post"))


## 5.4.2.3 ���̑��̕��@

url <- "r-datacollection.com/materials/http/helloworld.html"

res <- getURL(url = url, customrequest = "HEAD",
              header = TRUE)

cat(str_split(res,"\r")[[1]])

## 5.4.3 RCurl �̒ᐅ���֐�

url <- "www.r-datacollection.com/materials/http/helloworld.html"

(pres <- curlPerform(url = url))

performOptions <- curlOptions(url = url, 
                              writefunc =function(con) 
                                pres <<- con)

curlPerform(.opts = performOptions)

pres

content <- basicTextGatherer()

header <- basicTextGatherer()

debug <- debugGatherer()

performOptions <- curlOptions(url = url, 
                              writefunc = content$update, 
                              headerfunc = header$update, 
                              debugfunc = debug$update, 
                              verbose = TRUE)

curlPerform(.opts=performOptions)

str_sub(content$value(), 1, 100)

header$value()

names(debug$value())


## 5.4.4 ���N�G�X�g�Ԃł̃R�l�N�V�����ێ�
### curl �n���h��

handle <- getCurlHandle()

handle <- getCurlHandle(useragent = str_c(R.version$platform,
      R.version$version.string,
      sep=", "),
      httpheader = c(from = "ed@datacollection.com"), 
      followlocation = TRUE,
      cookiefile = "")

urls <- sprintf("http://www.r-datacollection.com/materials/http/abunchofasciis/file00%d.html", 330:340)

lapply(urls, getURL, curl = handle)


### �n���h�������
handle2 <- dupCurlHandle(handle,
                         httpheader = c(from = "ed@datacollection.com"))


## 5.4.5 �I�v�V����
### �����Ƃ��ăI�v�V������^����

url <- "www.r-datacollection.com/materials/http/helloworld.html"

res <- getURL(url = url, header = TRUE)

cat(str_split(res, "\r")[[1]])


### �n���h���̃I�v�V����

handle <- getCurlHandle(customrequest = "HEAD")

res <- getURL(url = url, curl = handle)

cat(str_split(res, "\r")[[1]])

res <- getURL(url = url, header = TRUE)

library(stringr)

cat(str_split(res, "\r")[[1]])

handle <- getCurlHandle(customrequest = "HEAD")

res <- getURL(url = url, curl = handle)

cat(str_split(res, "\r")[[1]])

res <- getURL(url = url, curl = handle)

cat(str_split(res, "\r")[[1]])

curl_options <- curlOptions(header = TRUE,
                            customrequest = "HEAD")

res <- getURL(url = url, .opts = curl_options)


### �O���[�o���I�v�V����

curl_options <- curlOptions(header = TRUE, 
                            customrequest = "HEAD")

res <- getURL(url = url, .opts = curl_options)

cat(postForm(url, .params = c(name = "Eddie", age = "32"),
             style = "post",
             .opts = list(useragent = "Eddie�fs R scraper",
                          referer = "www.r-datacollection.com")))


options(RCurlOptions = list(header = TRUE, 
                            customrequest = "HEAD"))

res <- getURL(url = url)

options(RCurlOptions = list())

res <- getURL("www.r-datacollection.com/materials/http/POSTexample.php",
              customrequest = "POST",
              postfields = "name=Eddie&age=32")

cat(str_split(res, "\r")[[1]])

### ���N�G�X�g�w�b�_�t�B�[���h�̒ǉ�

url <- "r-datacollection.com/materials/http/ReturnHTTP.php"

res <- getURL(url = url)

cat(str_split(res, "\r")[[1]])

standardHeader <- list(
  from = "eddie@r-datacollection.com",
  'user-agent' = str_c(
    R.version$platform,
    R.version$version.string,
    sep=", "))

res <- getURL(url = url,
              httpheader = standardHeader)

cat(str_split(res, "\r")[[1]])


### �f�t�H���g�̃I�v�V����

defaultOptions <- curlOptions(
  httpheader = list(
    from = "Eddie@r-datacollection.com",
    'user-agent' = str_c(
      R.version$platform,
      R.version$version.string,
                         sep=", ")),
  followlocation = TRUE,
  maxredirs = 10,
  connecttimeout = 10,
  timeout = 300,
  cookiefile = "RCurlCookies.txt",
  cainfo = system.file("CurlSSL","cacert.pem",
                       package = "RCurl"))


options(RCurlOptions = defaultOptions)

options(RCurlOptions = list())

## 5.4.6 �f�o�b�O

getURL("http://www.stata-datacollection.com")

url <- "httpbin.org/get"

res <- getURL(url = url)

cat(res)

### RCurl �̃f�o�b�O�֐�
debugInfo <- debugGatherer()

names(debugInfo)

class(debugInfo[[1]])

url <- "r-datacollection.com/materials/http/helloworld.html"

res <- getURL(url = url, 
              debugfunction = debugInfo$update,      
              verbose = TRUE)

names(debugInfo$value())

cat(debugInfo$value()["text"])

cat(str_split(debugInfo$value()["headerIn"], "\r")[[1]])

cat(str_split(debugInfo$value()["headerOut"], "\ r")[[1]])

cat(str_split(debugInfo$value()["dataIn"], "\r")[[1]]) 

cat(str_split(debugInfo$value()["dataOut"], "\r")[[1]])

cat(str_split(debugInfo$value()["sslDataIn"], "\r")[[1]])


handle <- getCurlHandle()

url <- "r-datacollection.com/materials/http/helloworld.html"

res <- getURL(url = url, curl = handle)

handleInfo <- getCurlInfo(handle)

names(handleInfo)

handleInfo[c("total.time", "pretransfer.time")]

preTransTimeNoReuse <- rep(NA, 10)

preTransTimeReuse <- rep(NA, 10)

url <- "r-datacollection.com/materials/http/helloworld.html"

#R> # �R�l�N�V�������ė��p���Ȃ��ꍇ
for(i in 1:10){
  handle <- getCurlHandle()
  res <- getURL(url=url, curl=handle)
  handleInfo <- getCurlInfo(handle)
  preTransTimeNoReuse[i] <- handleInfo$pretransfer.time
}

#R> # �ė��p����ꍇ
handle <- getCurlHandle()
for(i in 1:10){
  res <- getURL(url=url, curl=handle)
  handleInfo <- getCurlInfo(handle)
  preTransTimeReuse[i] <- handleInfo$pretransfer.time
}

preTransTimeNoReuse

preTransTimeReuse


### 5.4.7 �G���[����

getCurlErrorClassNames()[c(2:4, 7, 8, 10, 23, 29, 35, 64)]

url1 <- "wwww.r-datacollection.com/materials/http/helloworld.html"

res <- getURL(url1)

url2 <- "www.r-datacollection.com/materials/http/helloworld.html"

res <- tryCatch(
  getURL(url = url1),
  COULDNT_RESOLVE_HOST = function(error) {
    getURL(url = url2)
  },
  error = function(error) {
    print(error$message)
    NA
  }
)

cat(str_split(res,"\ r")[[1]])