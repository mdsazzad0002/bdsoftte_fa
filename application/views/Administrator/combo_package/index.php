<style>
	.v-select {
		margin-top: -2.5px;
		float: right;
		min-width: 180px;
		margin-left: 5px;
	}

	.v-select .dropdown-toggle {
		padding: 0px;
		height: 25px;
	}

	.v-select input[type=search],
	.v-select input[type=search]:focus {
		margin: 0px;
	}

	.v-select .vs__selected-options {
		overflow: hidden;
		flex-wrap: nowrap;
	}

	.v-select .selected-tag {
		margin: 2px 0px;
		white-space: nowrap;
		position: absolute;
		left: 0px;
	}

	.v-select .vs__actions {
		margin-top: -5px;
	}

	.v-select .dropdown-menu {
		width: auto;
		overflow-y: auto;
	}

	#searchForm select {
		padding: 0;
		border-radius: 4px;
	}

	#searchForm .form-group {
		margin-right: 5px;
	}

	#searchForm * {
		font-size: 13px;
	}

	.record-table {
		width: 100%;
		border-collapse: collapse;
	}

	.record-table thead {
		background-color: #0097df;
		color: white;
	}

	.record-table th,
	.record-table td {
		padding: 3px;
		border: 1px solid #454545;
	}

	.record-table th {
		text-align: center;
	}
</style>
<div id="salesRecord">
	<div class="row" style="border-bottom: 1px solid #ccc;padding: 3px 0;">
		<div class="col-md-12">
			<form class="form-inline" id="searchForm" @submit.prevent="getSearchResult">
				<div class="form-group">
					<label>Search Type</label>
					<select class="form-control" v-model="searchType">
						<option value="">All</option>
					</select>
				</div>

		

				<div class="form-group" >
					<label>Record Type</label>
					<select class="form-control" v-model="recordType" @change="sales = []">
						<option value="without_details">Without Details</option>
						<option value="with_details">With Details</option>
					</select>
				</div>

				<div class="form-group">
					<input type="date" class="form-control" v-model="dateFrom">
				</div>

				<div class="form-group">
					<input type="date" class="form-control" v-model="dateTo">
				</div>

				<div class="form-group" style="margin-top: -5px;">
					<input type="submit" value="Search">
				</div>
			</form>
		</div>
	</div>

 <div class="row" style="margin-top:15px;">
		<div class="col-md-12" style="margin-bottom: 10px;">
			<a href="" @click.prevent="print"><i class="fa fa-print"></i> Print</a>
		</div>
		<div class="col-md-12">
			<div class="table-responsive" id="reportContent">
				<table
					class="record-table"
				
					
					>
					<thead>
						<tr>
							<th>Package No.</th>
							<th>Date</th>
							<th>Package Name</th>
							
							<th>Total</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<template v-for="sale in sales">
							<tr>
								<td>{{ sale.comboInvoice }}</td>
								<td>{{ sale.add_time }}</td>
								<td>{{ sale.packageName }}</td>
								<td>{{ sale.total }}</td>
								
								<td style="text-align:center;">
									<a href="" title="Sale Invoice" v-bind:href="`/combo_package/${sale.ComboId}`" target="_blank"><i class="fa fa-file"></i></a>
							
                                    <a href="javascript:" title="Edit Sale" @click="checkReturnAndEdit(sale)"><i class="fa fa-edit"></i></a>
                                    <a href="" title="Delete Sale" @click.prevent="deleteSale(sale.ComboId)"><i class="fa fa-trash"></i></a>
									
								</td>
							</tr>
							
							
						</template>
					</tbody>
				</table>


				
			</div>
		</div>
	</div> 
</div>

<script src="<?php echo base_url(); ?>assets/js/vue/vue.min.js"></script>
<script src="<?php echo base_url(); ?>assets/js/vue/axios.min.js"></script>
<script src="<?php echo base_url(); ?>assets/js/vue/vue-select.min.js"></script>
<script src="<?php echo base_url(); ?>assets/js/moment.min.js"></script>
<script src="<?php echo base_url(); ?>assets/js/lodash.min.js"></script>

<script>
	Vue.component('v-select', VueSelect.VueSelect);
	new Vue({
		el: '#salesRecord',
		data() {
			return {
				searchType: '',
				recordType: 'without_details',
				dateFrom: moment().format('YYYY-MM-DD'),
				dateTo: moment().format('YYYY-MM-DD'),
				customers: [],
				selectedCustomer: null,
				employees: [],
				selectedEmployee: null,
				products: [],
				selectedProduct: null,
				users: [],
				selectedUser: null,
				categories: [],
				selectedCategory: null,
				sales: [],
		
			}
		},
		methods: {
	
			getSearchResult() {
			
                this.getSalesRecord();
			},
			getSalesRecord() {
				let filter = {
					dateFrom: this.dateFrom,
					dateTo: this.dateTo
				}

				let url = '/get_combo_packages';
				
				axios.post(url, filter)
					.then(res => {
					
							this.sales = res.data;
						
					})
					.catch(error => {
						if (error.response) {
							alert(`${error.response.status}, ${error.response.statusText}`);
						}
					})
			},
			
			deleteSale(saleId) {
				let deleteConf = confirm('Are you sure?');
				if (deleteConf == false) {
					return;
				}
				axios.post('/delete_sales', {
						saleId: saleId
					})
					.then(res => {
						let r = res.data;
						alert(r.message);
						if (r.success) {
							this.getSalesRecord();
						}
					})
					.catch(error => {
						if (error.response) {
							alert(`${error.response.status}, ${error.response.statusText}`);
						}
					})
			},
			
		}
	})
</script>