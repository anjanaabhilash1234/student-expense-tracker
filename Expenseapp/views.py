from django.shortcuts import render
from django.http import HttpResponse
from django.shortcuts import HttpResponseRedirect,redirect
from django.db import connection

from  datetime import date 
from datetime import datetime
now = date.today()
today1=date.today()
import datetime
today_date = datetime.date.today()
today = today_date.strftime("%Y-%m-%d")

# Create your views here.

def index(request):
    return render(request,'index.html')
def login(request):
    return render(request,'login.html')

def forgotpasswordaction(request):
    email = request.GET['email']
    newpass = request.GET['newpass']

    cursor = connection.cursor()
    sql = "update login set upass=%s where uname=%s"
    cursor.execute(sql, [newpass, email])

    return HttpResponse("<script>alert('Password Updated');window.location='/index/';</script>")

def budget(request):
    db=connection.cursor()
    uid=request.session['uid']

    sql="select * from budget where uid='%s'"%(uid)
    db.execute(sql)
   
    rs=db.fetchall()
    tt=[]
    for row in rs:
        q={'bid':row[0],'uid':row[1],'month':row[2],'year':row[3],'amount':row[4]}
        tt.append(q)

    
    return render(request,'budget.html',{'tt':tt})




def budgetaction(request):

    db = connection.cursor()

    uid = request.session['uid']
    month = request.GET['month']
    year = request.GET['year']
    amount = request.GET['amount']

    sql = """insert into budget(uid,month,year,amount)
             values(%s,%s,%s,%s)"""

    db.execute(sql,[uid,month,year,amount])

    msg="<script>alert('Budget Added Successfully');window.location='/budget/';</script>"

    return HttpResponse(msg)


def delbgt(request):
    db=connection.cursor()
    id=request.GET['id']
    
    sql="delete from budget where bid='%s'"%(id)
    db.execute(sql)
    
    msg="<script>alert('Successfully Deleted');window.location='/budget/';</script>"
    
    return HttpResponse(msg)

def adminhome(request):
    return render(request,'adminhome.html')
def studenthome(request):
    return render(request,'studenthome.html')




def loginaction(request):
    cursor=connection.cursor()
    un=request.GET['uname']
    up=request.GET['upass']
    s="select * from login where uname='%s' and upass='%s'"%(un,up)
    cursor.execute(s)
    if(cursor.rowcount)>0:
        rs=cursor.fetchall()
        for row in rs:
            request.session['uid']=row[0]
            request.session['uname']=row[1]
            request.session['upass']=row[2]
            request.session['utype']=row[3]
        if(request.session['utype']=='admin'):
            return render(request,'adminhome.html')
        elif(request.session['utype']=='student'):
            return render (request,'studenthome.html')
        elif(request.session['utype']=='staff'):
            aid=request.session['uid']
            return render (request,'staffhome.html',{'aid':aid})
        elif(request.session['utype']=='branch'):
            return render (request,'branchhome.html')
    else:
        msg="<script>alert('login failed');window.location='/index/';</script>"
        return HttpResponse(msg)




def category(request):
    db=connection.cursor()

    sql="select * from income_category"
    db.execute(sql)
   
    rs=db.fetchall()
    tt=[]
    for row in rs:
        q={'icid':row[0],'cname':row[1]}
        tt.append(q)

    sql1="select * from expense_category"
    db.execute(sql1)
   
    rs1=db.fetchall()
    tt1=[]
    for row in rs1:
        q1={'ecid':row[0],'cname':row[1]}
        tt1.append(q1)
    return render(request,'category.html',{'tt1':tt1,'tt':tt})


def icaction(request):
    db=connection.cursor()
    cn=request.GET['cname']
    
    sql="insert into income_category(cname)values('%s')"%(cn)
    db.execute(sql)
    
    msg="<script>alert('Successfully Added');window.location='/category/';</script>"
    
    return HttpResponse(msg)


def ecaction(request):
    db=connection.cursor()
    cn=request.GET['cname']
    
    sql="insert into expense_category(cname)values('%s')"%(cn)
    db.execute(sql)
    
    msg="<script>alert('Successfully Added');window.location='/category/';</script>"
    
    return HttpResponse(msg)

    
def delic(request):
    db=connection.cursor()
    id=request.GET['id']
    
    sql="delete from income_category where icid='%s'"%(id)
    db.execute(sql)
    
    msg="<script>alert('Successfully Deleted');window.location='/category/';</script>"
    
    return HttpResponse(msg)

def delec(request):
    db=connection.cursor()
    id=request.GET['id']
    
    sql="delete from expense_category where ecid='%s'"%(id)
    db.execute(sql)
    
    msg="<script>alert('Successfully Deleted');window.location='/category/';</script>"
    
    return HttpResponse(msg)


def studentaction(request):
    db=connection.cursor()
    name=request.GET['name']
    g=request.GET['gen']
    dob=request.GET['dob']
    adr=request.GET['adr']
    c=request.GET['c']
    ins=request.GET['ins']
    ph=request.GET['phn']
    em=request.GET['email']
    pw=request.GET['pw']
    sql="insert into student(name,gen,dob,adr,course,inst,phn,email)values('%s','%s','%s','%s','%s','%s','%s','%s')"%(name,g,dob,adr,c,ins,ph,em)
    db.execute(sql)
    sql2="select max(sid) as uid from student"
    db.execute(sql2)
    rs=db.fetchall()
    for row in rs:
         sql3="insert into login(uid,uname,upass,utype)values('%s','%s','%s','student')"%(row[0],em,pw)
         db.execute(sql3)
    msg="<script>alert('Successfully Registered');window.location='/index/';</script>"
    return HttpResponse(msg)


def supdateaction(request):
    db=connection.cursor()
    uid=request.session['uid']
    name=request.GET['name']
    adr=request.GET['adr']
    c=request.GET['c']
    ins=request.GET['ins']
    ph=request.GET['phn']
    em=request.GET['email']
    sql="update student set name='%s',adr='%s',course='%s',inst='%s',phn='%s',email='%s' where sid='%s'"%(name,adr,c,ins,ph,em,uid)
    db.execute(sql)
    
    sql3="update login set uname='%s' where uid='%s' and utype='student'"%(em,uid)
    db.execute(sql3)
    msg="<script>alert('Successfully Updated');window.location='/sprofile/';</script>"
    return HttpResponse(msg)


def expense(request):
    db=connection.cursor()
    uid=request.session['uid']

    sql="select * from expense where uid='%s'"%(uid)
    db.execute(sql)
   
    rs=db.fetchall()
    ex=[]
    for row in rs:
        q={'eid':row[0],'uid':row[1],'cat':row[2],'amt':row[3],'ds':row[4],'rdate':row[5],'payment_mode':row[6]}
        ex.append(q)

    sql1="select * from expense_category"
    db.execute(sql1)
   
    rs1=db.fetchall()
    tt1=[]
    for row in rs1:
        q1={'ecid':row[0],'cname':row[1]}
        tt1.append(q1)
    return render(request,'expense.html',{'tt1':tt1,'ex':ex})

from datetime import datetime, date
from django.http import HttpResponse
from django.db import connection

def exaction(request):
    db = connection.cursor()
    
    uid = request.session['uid']
    cname = request.GET['cname']
    amt = float(request.GET['amt'])
    dss = request.GET['dss']
    pmode = request.GET['pmode']
    dt = request.GET['dt']  # format: YYYY-MM-DD

    # Convert date
    expense_date = datetime.strptime(dt, "%Y-%m-%d")
    month = expense_date.strftime("%B")   # February
    year = expense_date.strftime("%Y")    # 2026

    # 🔹 1. Get Budget for that month
    db.execute("SELECT amount FROM budget WHERE uid=%s AND month=%s AND year=%s",
               [uid, month, year])
    budget_data = db.fetchone()

    if not budget_data:
        return HttpResponse("<script>alert('Budget not set for this month');window.location='/expense/';</script>")

    budget_amount = float(budget_data[0])

    # 🔹 2. Get total expense of that month
    db.execute("""
        SELECT COALESCE(SUM(amt),0) 
        FROM expense 
        WHERE uid=%s 
        AND MONTH(rdate)=%s 
        AND YEAR(rdate)=%s
    """, [uid, expense_date.month, expense_date.year])

    total_spent = float(db.fetchone()[0])

    # 🔹 3. Check if exceeds
    if total_spent + amt > budget_amount:
        return HttpResponse("<script>alert('Budget exceeded! Cannot add expense');window.location='/expense/';</script>")

    # 🔹 4. Insert if safe
    db.execute("""
        INSERT INTO expense(uid,cat,amt,ds,rdate,payment_mode)
        VALUES(%s,%s,%s,%s,%s,%s)
    """, [uid, cname, amt, dss, dt, pmode])

    return HttpResponse("<script>alert('Successfully Added');window.location='/expense/';</script>")





def income(request):
    db=connection.cursor()
    uid=request.session['uid']

    sql="select * from income_category"
    db.execute(sql)
   
    rs=db.fetchall()
    tt=[]
    for row in rs:
        q={'icid':row[0],'cname':row[1]}
        tt.append(q)

    sql1="select * from income where uid='%s'"%(uid)
    db.execute(sql1)
   
    rs1=db.fetchall()
    tt1=[]
    for row in rs1:
        q1={'incid':row[0],'uid':row[1],'cat':row[2],'amt':row[3],'ds':row[4],'date':row[5]}
        tt1.append(q1)
    return render(request,'income.html',{'tt1':tt1,'tt':tt})

def incaction(request):
    db=connection.cursor()
    uid=request.session['uid']
    cname=request.GET['cname']
    amt=request.GET['amt']
    dss=request.GET['dss']
    dt=request.GET['dt']
    
    
    sql="insert into income(uid,cat,amt,ds,date)values('%s','%s','%s','%s','%s')"%(uid,cname,amt,dss,dt)
    db.execute(sql)
    

    msg="<script>alert('Successfully Added');window.location='/income/';</script>"
    return HttpResponse(msg)

def delincome(request):
    db=connection.cursor()
    id=request.GET['id']
    
    sql="delete from income where incid='%s'"%(id)
    db.execute(sql)
    
    msg="<script>alert('Successfully Deleted');window.location='/income/';</script>"
    
    return HttpResponse(msg)

def delexpense(request):
    db=connection.cursor()
    id=request.GET['id']
    
    sql="delete from expense where eid='%s'"%(id)
    db.execute(sql)
    
    msg="<script>alert('Successfully Deleted');window.location='/expense/';</script>"
    
    return HttpResponse(msg)

def update_ec(request):
    if request.method == "POST":
        id = request.POST['id']
        cname = request.POST['cname']

        cursor = connection.cursor()
        cursor.execute("update expense_category set cname=%s where ecid=%s", [cname, id])

        msg="<script>alert('Successfully Updated');window.location='/category/';</script>"
    
        return HttpResponse(msg)
    
def update_ic(request):
    if request.method == "POST":
        id = request.POST['id']
        cname = request.POST['cname']

        cursor = connection.cursor()
        cursor.execute("update income_category set cname=%s where icid=%s", [cname, id])

        msg="<script>alert('Successfully Updated');window.location='/category/';</script>"
    
        return HttpResponse(msg)



def feedback(request):

    return render(request,'feedback.html')


def fbaction(request):
    db=connection.cursor()
    uid=request.session['uid']
    typ=request.GET['typ']
    msg=request.GET['message']
    today = date.today()
    
    
    sql="insert into feedback(uid,typ,msg,date)values('%s','%s','%s','%s')"%(uid,typ,msg,today)
    db.execute(sql)
    

    msg="<script>alert('Successfully Submitted');window.location='/feedback/';</script>"
    return HttpResponse(msg)


def avfeedback(request):
    db=connection.cursor()

    sql="select feedback.*,student.name from feedback inner join student on feedback.uid=student.sid"
    db.execute(sql)
   
    rs=db.fetchall()
    tt=[]
    for row in rs:
        q={'fid':row[0],'uid':row[1],'typ':row[2],'msg':row[3],'date':row[4],'name':row[5]}
        tt.append(q)
    return render(request,'avfeedback.html',{'tt':tt})


def avstudents(request):
    db=connection.cursor()

    sql="select * from student"
    db.execute(sql)
   
    rs=db.fetchall()
    tt=[]
    for row in rs:
        q={'sid':row[0],'name':row[1],'gen':row[2],'dob':row[3],'adr':row[4],'course':row[5],'inst':row[6],'phn':row[7],'email':row[8]}
        tt.append(q)
    return render(request,'avstudents.html',{'tt':tt})

def delstud(request):
    cursor = connection.cursor()
    id = request.GET['id']
    sql1 = "delete from student WHERE sid='%s'"%(id)
    cursor.execute(sql1)
    sql2 ="delete from login where uid='%s' and utype='student'"%(id)
    cursor.execute(sql2)
    msg = "<script>alert('Successfully Deleted');window.location=/avstudents/;</script>"
    return HttpResponse(msg) 


def sprofile(request):
    db=connection.cursor()
    uid=request.session['uid']
    sql="select * from student where sid='%s'"%(uid)
    db.execute(sql)
   
    rs=db.fetchall()
    tt=[]
    for row in rs:
        q={'sid':row[0],'name':row[1],'gen':row[2],'dob':row[3],'adr':row[4],'course':row[5],'inst':row[6],'phn':row[7],'email':row[8]}
        tt.append(q)
    return render(request,'sprofile.html',{'tt':tt})



from datetime import datetime

def sreport(request):
    db = connection.cursor()
    uid = request.session['uid']

    now = datetime.now()
    month = now.month
    year = now.year

    sql = """
        SELECT cat, SUM(amt) 
        FROM expense 
        WHERE uid=%s AND MONTH(rdate)=%s AND YEAR(rdate)=%s
        GROUP BY cat
    """
    db.execute(sql, [uid, month, year])
    result = db.fetchall()

    labels = []
    data = []

    for row in result:
        labels.append(row[0])
        data.append(float(row[1]))

    # ✅ Calculations (NO template errors now)
    total = sum(data)
    top_cat = labels[data.index(max(data))] if data else "None"

    # ✅ Combine for template loop
    category_data = zip(labels, data)

    return render(request, 'sreport.html', {
        'labels': labels,
        'data': data,
        'total': total,
        'top_cat': top_cat,
        'category_data': category_data
    })



from datetime import datetime
from calendar import month_name

def saving_suggestions(request):

    db = connection.cursor()
    uid = request.session['uid']

    now = datetime.now()
    month = month_name[now.month]
    year = now.year

    # -------- Expense by category --------
    sql = """
    SELECT cat, SUM(amt)
    FROM expense
    WHERE uid=%s
    GROUP BY cat
    """
    db.execute(sql, [uid])
    rs = db.fetchall()

    suggestions = []

    total_spent = 0

    for row in rs:
        cat = row[0]
        amt = row[1] if row[1] else 0

        total_spent += amt

        if cat == "Food" and amt > 3000:
            suggestions.append("🍔 Try reducing outside food expenses")

        if cat == "movie" and amt > 2000:
            suggestions.append("🎬 Avoid unnecessary entertainment spending")

        if cat == "Travel" and amt > 2500:
            suggestions.append("🚗 Consider cheaper travel options like bus or sharing")

    # -------- Get Budget --------
    sql2 = """
    SELECT amount
    FROM budget
    WHERE uid=%s AND month=%s AND year=%s
    """
    db.execute(sql2, [uid, month, year])
    budget_data = db.fetchone()

    if budget_data:
        budget_amt = budget_data[0]

        savings = budget_amt - total_spent

        if savings < 0:
            suggestions.append(f"⚠️ You exceeded your budget by ₹{abs(savings):.2f}. Try stricter expense control.")

        else:
            suggestions.append(f"💰 Great! You saved ₹{savings:.2f} this month.")

            # -------- Investment Suggestions --------
            if savings > 500:
                suggestions.append("📈 Consider investing in SIP (Mutual Funds) for long-term growth")

            if savings > 1000:
                suggestions.append("🏦 You can invest in Recurring Deposits (RD) for safe returns")

            if savings > 2000:
                suggestions.append("💡 Explore Public Provident Fund (PPF) for tax-free savings")

            if savings > 3000:
                suggestions.append("📊 Try diversifying into stocks or index funds (long-term)")

    else:
        suggestions.append("⚠️ No budget set for this month. Set a budget to track savings better.")

    # -------- Default Message --------
    if len(suggestions) == 0:
        suggestions.append("✅ Your spending is well managed. Keep it up!")

    return render(request, 'saving_suggestions.html', {
        'suggestions': suggestions
    })





def payment_analysis(request):

    db = connection.cursor()
    uid = request.session['uid']

    sql = """
    SELECT payment_mode, SUM(amt)
    FROM expense
    WHERE uid=%s
    GROUP BY payment_mode
    """

    db.execute(sql,[uid])
    rs = db.fetchall()

    labels=[]
    data=[]

    total = 0
    upi = 0
    cash = 0

    for row in rs:
        labels.append(row[0])
        amount = float(row[1])
        data.append(amount)

        total += amount

        if row[0].lower() == 'upi':
            upi = amount
        elif row[0].lower() == 'cash':
            cash = amount

    # --- Insight Logic ---
    suggestion = ""

    if total > 0:
        upi_percent = (upi / total) * 100
        cash_percent = (cash / total) * 100

        if upi_percent > 80:
            suggestion = "⚠️ Very high UPI usage detected. You may be overspending due to frictionless payments. Consider setting limits."

        elif upi_percent > 60:
            suggestion = "UPI is your dominant mode. It's fast and trackable, but be mindful of impulse spending."

        elif cash_percent > 80:
            suggestion = "Strong cash usage. This helps control spending effectively, but you miss digital tracking benefits."

        elif cash_percent > 60:
            suggestion = "You prefer cash. Good for discipline, but using UPI occasionally can improve tracking."

        else:
            suggestion = "Balanced usage of UPI and cash. This is ideal for both control and convenience."

    return render(request,'payment_analysis.html',{
        'labels':labels,
        'data':data,
        'suggestion': suggestion
    })





from calendar import monthrange, month_name
from datetime import datetime

def budget_prediction(request):

    db = connection.cursor()
    uid = request.session['uid']

    now = datetime.now()
    month_num = now.month
    month = month_name[month_num]   # Converts 3 -> March
    year = now.year
    day = now.day

    # Get budget (month stored as January, February...)
    sql = "select amount from budget where uid=%s and month=%s and year=%s"
    db.execute(sql, [uid, month, year])
    budget = db.fetchone()

    # Expense query still uses month number from date
    sql2 = """select sum(amt) from expense
              where uid=%s and month(rdate)=%s and year(rdate)=%s"""
    db.execute(sql2, [uid, month_num, year])
    spent = db.fetchone()[0]

    if spent is None:
        spent = 0

    total_days = monthrange(year, month_num)[1]

    avg_per_day = spent / day

    predicted = avg_per_day * total_days

    alert = "Safe"

    if budget and predicted > budget[0]:
        alert = "Warning: Budget may exceed"

    return render(request, 'budget_prediction.html', {
        'spent': spent,
        'predicted': predicted,
        'budget': budget,
        'alert': alert
    })




from datetime import datetime
from calendar import month_name
from django.db import connection
from django.shortcuts import render

def spending_pattern(request):

    db = connection.cursor()
    uid = request.session['uid']

    # 👉 Current date
    today = datetime.now()

    # 👉 Get last 3 months (month number + year)
    months = []
    for i in range(3):
        m = today.month - i
        y = today.year

        if m <= 0:
            m += 12
            y -= 1

        months.append((m, y))   # (month_number, year)

    # 👉 Fetch expenses using rdate column
    sql = """
    SELECT cat, SUM(amt) 
    FROM expense 
    WHERE uid=%s 
    AND (
        (MONTH(rdate)=%s AND YEAR(rdate)=%s) OR
        (MONTH(rdate)=%s AND YEAR(rdate)=%s) OR
        (MONTH(rdate)=%s AND YEAR(rdate)=%s)
    )
    GROUP BY cat
    ORDER BY SUM(amt) DESC
    """

    db.execute(sql, [
        uid,
        months[0][0], months[0][1],
        months[1][0], months[1][1],
        months[2][0], months[2][1]
    ])

    rs = db.fetchall()

    data = []
    total_spending = 0

    for row in rs:
        data.append({
            'category': row[0],
            'total': float(row[1])
        })
        total_spending += float(row[1])

    # 👉 Fetch budget for last 3 months
    total_budget = 0

    for m in months:
        db.execute(
            "SELECT amount FROM budget WHERE uid=%s AND month=%s AND year=%s",
            [uid, month_name[m[0]], m[1]]   # convert month number → name
        )
        res = db.fetchone()

        if res:
            total_budget += float(res[0])

    # 👉 Generate suggestion
    if total_budget == 0:
        suggestion = "No budget set for the last 3 months. Set a budget to track your spending effectively."
    else:
        if total_spending < total_budget * 0.7:
            suggestion = "Excellent! Your spending is well controlled. You can save more with this habit."
        elif total_spending <= total_budget:
            suggestion = "Good job! You are within your budget. Try reducing small unnecessary expenses."
        else:
            suggestion = "Alert! Your spending exceeds your budget. Reduce high-spending categories."

    return render(request, 'spending_pattern.html', {
        'data': data,
        'total_spending': total_spending,
        'total_budget': total_budget,
        'suggestion': suggestion
    })





from sklearn.linear_model import LinearRegression
import numpy as np
from calendar import monthrange
from datetime import datetime
from django.shortcuts import render
from django.db import connection

def future_expense_prediction(request):

    db = connection.cursor()
    uid = request.session['uid']

    now = datetime.now()
    month = now.month
    year = now.year

    # 🔹 Get daily total expense
    sql = """
    SELECT DAY(rdate), SUM(amt)
    FROM expense
    WHERE uid=%s AND MONTH(rdate)=%s AND YEAR(rdate)=%s
    GROUP BY DAY(rdate)
    ORDER BY DAY(rdate)
    """
    db.execute(sql, [uid, month, year])
    rows = db.fetchall()

    if len(rows) < 5:
        return render(request, "prediction.html", {
            "msg": "Add expenses for at least 5 days to enable AI prediction"
        })

    days = []
    cumulative_expense = []

    total = 0

    # 🔹 Convert to cumulative data
    for row in rows:
        day = row[0]
        expense = float(row[1])

        total += expense

        days.append([day])
        cumulative_expense.append(total)

    X = np.array(days)
    y = np.array(cumulative_expense)

    # 🔹 Train model
    model = LinearRegression()
    model.fit(X, y)

    total_days = monthrange(year, month)[1]

    # 🔹 Predict total expense at end of month
    predicted_total = model.predict([[total_days]])[0]

    # 🔹 Current spending
    current_spending = total

    # 🔹 Daily average (optional insight)
    avg_per_day = current_spending / len(rows)

    return render(request, "prediction.html", {
        "predicted_total": round(float(predicted_total), 2),
        "current_spending": round(current_spending, 2),
        "avg_per_day": round(avg_per_day, 2),
        "month": month
    })