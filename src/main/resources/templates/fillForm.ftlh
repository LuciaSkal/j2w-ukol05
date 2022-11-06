[#ftl]
[#import "/spring.ftl" as spring]
<!DOCTYPE html>
<html lang="cs">
<head>
    <meta charset="UTF-8">
    <title>Registrace na letní dětský tábor</title>
    <link rel="stylesheet" href="/style.css"/>
</head>
<body>
<div class="container">
    <form class="basket" action="/" method="post">
        <h1>Registrace na letní dětský tábor</h1>

        <label for="firstName" class="row">Jméno:</label>
        [@spring.formInput path="form.firstName" /]
        <div class="error">[@spring.showErrors "<br>"/]</div>

        <label for="lastName" class="row">Příjmení:</label>
        [@spring.formInput path="form.lastName" /]
        <div class="error">[@spring.showErrors "<br>"/]</div>

        <label for="birthDate" class="row">Datum narození:</label>
        [@spring.formInput fieldType="date" path="form.birthDate" /]
        <div class="error">[@spring.showErrors "<br>"/]</div>

        <div class="row">Pohlaví:</div>
        <div class="group">
            <div>
                <input id="gender1" type="radio" name="gender" value="MALE"/>
                <label for="gender1">Chlapec</label>
            </div>
            <div>
                <input id="gender2" type="radio" name="gender" value="FEMALE"/>
                <label for="gender2">Dívka</label>
            </div>
        </div>
        [@spring.bind "form.gender"/]
        <div class="error">[@spring.showErrors "<br>"/]</div>


        <label for="tourDate" class="row">Turnus:</label>
        [@spring.formSingleSelect path="form.tourDate" options={
        "": "",
        "tourDate1": "5. až 11. července",
        "tourDate2": "12. až 18. července",
        "tourDate3": "19. až 25. července"
        } /]
        <div class="error">[@spring.showErrors "<br>"/]</div>

        <label for="parentEmail" class="row">Email zakonneho zastupcu:</label>
        [@spring.formInput path="form.parentEmail" /]

        <label for="parentPhone" class="row">Telefon zakonneho zastupcu:</label>
        [@spring.formInput path="form.parentPhone" /]

        <div class="row controls">
            <button type="submit">Objednat</button>
        </div>
    </form>

</div>
</body>
</html>
