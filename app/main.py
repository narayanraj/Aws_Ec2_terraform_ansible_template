from flask import Flask, render_template, request

app = Flask(__name__)

STATES = [
    'Andhra Pradesh', 'Arunachal Pradesh', 'Assam', 'Bihar', 'Chhattisgarh',
    'Goa', 'Gujarat', 'Haryana', 'Himachal Pradesh', 'Jharkhand', 'Karnataka',
    'Kerala', 'Madhya Pradesh', 'Maharashtra', 'Manipur', 'Meghalaya',
    'Mizoram', 'Nagaland', 'Odisha', 'Punjab', 'Rajasthan', 'Sikkim',
    'Tamil Nadu', 'Telangana', 'Tripura', 'Uttar Pradesh', 'Uttarakhand',
    'West Bengal', 'Delhi', 'Jammu and Kashmir', 'Ladakh'
]

# In-memory user storage (not persistent)
users = []

@app.route('/', methods=['GET', 'POST'])
def form():
    data = None
    if request.method == 'POST':
        user = {
            'name': request.form['name'],
            'address': request.form['address'],
            'state': request.form['state'],
            'phone': request.form['phone'],
            'company_role': request.form['company_role']
        }
        users.append(user)
        data = user
        return render_template('form.html', states=STATES, data=data, submitted=True)
    return render_template('form.html', states=STATES, submitted=False)

@app.route('/search', methods=['GET', 'POST'])
def search():
    results = None
    if request.method == 'POST':
        name = request.form.get('name', '').strip().lower()
        company_role = request.form.get('company_role', '').strip().lower()
        results = [u for u in users if (name in u['name'].lower() if name else True) and (company_role in u['company_role'].lower() if company_role else True)]
    return render_template('search.html', results=results)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
