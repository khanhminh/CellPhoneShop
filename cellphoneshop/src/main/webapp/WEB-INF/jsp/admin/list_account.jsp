<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<div>
    <ul class="breadcrumb">
        <li>
            <a href="#">Quản lý tài khoản</a> <span class="divider">/</span>
        </li>
        <li>
            <a href="#">Danh sách tài khoản</a>
        </li>
    </ul>
</div>

<div class="row-fluid sortable">
    <div class="box span12">
        <div class="box-header well">
            <h2><i class="icon-user"></i>Tài khoản</h2>
            <div class="box-icon">
                <a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
            </div>
        </div>
        <div class="box-content">
            <table class="table table-striped table-bordered bootstrap-datatable datatable">
                <thead>
                    <tr>
                        <th>Tên đăng nhập</th>
                        <th>Ngày tạo</th>
                        <th>Role</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach (var tk in Model.ListAccount)
                    {
                        <tr>
                            <td>@tk.Username</td>
                            <td class="center">@tk.DateCreate</td>
                            <td class="center">
                                @if (tk.Role != null)
                                {
                                    int i = 0;
                                    foreach (string role in tk.Role)
                                    {
                                        if (i < tk.Role.Length - 1)
                                        {
                                            <span><b>@role</b>, </span>
                                        }
                                        else
                                        {
                                            <span><b>@role</b></span>
                                        }
                                        i++;
                                    }
                                }
                            </td>
                            <td class="center">
                                <a class="btn btn-success" href="/Admin/DetailsAccount?username=@tk.Username">
                                    <i class="icon-zoom-in icon-white"></i>
                                    Chi tiết                                       
									</a>
                                <a class="btn btn-info" href="/Admin/EditAccount?username=@tk.Username">
                                    <i class="icon-edit icon-white"></i>
                                    Sửa                                            
									</a>
                                <a class="btn btn-primary" href="/Admin/SetRole?username=@tk.Username">
                                    <i class="icon-edit icon-white"></i>
                                    Phân quyền                                           
									</a>
                                <a class="btn btn-danger" href="#">
                                    <i class="icon-trash icon-white"></i>
                                    Delete
									</a>
                            </td>
                        </tr>  
                    }
                </tbody>
            </table>
        </div>
    </div>
</div>