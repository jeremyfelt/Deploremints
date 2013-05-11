# Deploremints

...

## BitBucket POST Data

After a `json_decode()` of `$_POST['payload']`, we get an object with the following information.

```
stdClass Object
    [repository] => stdClass Object
        (
            [website] =>
            [fork] =>
            [name] => jeremyfelt.com
            [scm] => git
            [owner] => jeremyfelt
            [absolute_url] => /jeremyfelt/jeremyfelt.com/
            [slug] => jeremyfelt.com
            [is_private] => 1
        )

    [user] => jeremyfelt
    [truncated] =>
    [commits] => Array
        (
            [0] => stdClass Object
                (
                    [node] => 5fdc64ff6d6e
                    [files] => Array
                        (
                            [0] => stdClass Object
                                (
                                    [type] => modified
                                    [file] => test.txt
                                )

                        )

                    [branch] => master
                    [utctimestamp] => 2013-05-11 04:03:00+00:00
                    [timestamp] => 2013-05-11 06:03:00
                    [raw_node] => 5fdc64ff6d6eddad904831cf924d6817e243657f
                    [message] => Test deploy hook

                    [size] => -1
                    [author] => jeremyfelt
                                        [parents] => Array
                        (
                            [0] => 009082b6a821
                        )

                    [raw_author] => jeremyfelt <jeremy.felt@gmail.com>
                    [revision] =>
                )

        )

    [canon_url] => https://bitbucket.org
)
```
