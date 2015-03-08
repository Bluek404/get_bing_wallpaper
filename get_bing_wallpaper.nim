# Copyright 2015 Bluek404
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import httpclient, json

const url = "http://www.bing.com/HPImageArchive.aspx?format=js&idx=0&n=8"

proc findLastString(a:string, item:char): int =
  var last:int
  for i in items(a):
    if i == item:
      last = result
    inc(result)
  result = -1
  return last  

var data = parseJson(getContent(url))

for img in data["images"]:
  var
    imgURL = img["url"].str
    imgName:string = ""

  for i in findLastString(imgURL, '/') + 1 .. imgURL.len:
    imgName.add(imgURL[i])

  writeFile(imgName, getContent(imgURL))
  echo(imgName)
